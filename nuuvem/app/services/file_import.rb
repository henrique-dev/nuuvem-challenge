# frozen_string_literal: true

# Documentation
class FileImport

  def initialize(file_upload:, file: nil)
    @file_upload = file_upload
    @file = file
    @file ||= ActiveStorage::Blob.service.path_for(file_upload.purchase_data.key)
  end

  def self.call(**args)
    new(**args).import_a_file
  end

  def call
    import_a_file
  end

  def import_a_file
    File.open(@file, 'r') do |f|
      lines = f.each_line.to_a
      lines.shift.split("\t") # header
      lines.each do |line|
        @purchase_data = extract_data line.split("\t")
        client, merchant = create_actors
        item = create_item(merchant)
        item_purchase = create_purchase(client, merchant, item)

        @file_upload.total ||= 0
        @file_upload.total = @file_upload.total + (item_purchase.count * item.price)
        @file_upload.save
      end
    end
    if Rails.env.test?
      SendUpdatesJob.new.perform
    else
      SendUpdatesJob.perform_later
    end
  end

  def extract_data(array_with_data)
    {
      purchaser_name: array_with_data[0],
      item_description: array_with_data[1],
      item_price: array_with_data[2],
      purchase_count: array_with_data[3],
      merchant_address: array_with_data[4],
      merchant_name: array_with_data[5]
    }
  end

  def create_actors
    client = ClientCreator.call(name: @purchase_data[:purchaser_name])
    merchant = MerchantCreator.call(name: @purchase_data[:merchant_name],
                                    full_address: @purchase_data[:merchant_address])
    [client, merchant]
  end

  def create_item(merchant)
    ItemCreator.call(description: @purchase_data[:item_description],
                     price: @purchase_data[:item_price], merchant: merchant)
  end

  def create_purchase(client, merchant, item)
    purchase = PurchaseCreator.call(client: client, merchant: merchant)
    ItemPurchaseCreator.call(count: @purchase_data[:purchase_count], purchase: purchase, item: item)
  end
end
