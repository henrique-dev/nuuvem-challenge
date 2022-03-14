# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FileImport, type: :service do
  let(:file_to_import) do
    @file_to_import = File.new('out.txt', 'w')
    @file_to_import.puts('purchaser name	item description	item price	purchase count	merchant address	merchant name')
    @file_to_import.puts('João Silva	R$10 off R$20 of food	10.0	2	987 Fake St	Bob\'s Pizza')
    @file_to_import.puts('Amy Pond	R$30 of awesome for R$10	10.0	5	456 Unreal Rd	Tom\'s Awesome Shop')
    @file_to_import.puts('Marty McFly	R$20 Sneakers for R$5	5.0	1	123 Fake St	Sneaker Store Emporium')
    @file_to_import.puts('Snake Plissken	R$20 Sneakers for R$5	5.0	4	123 Fake St	Sneaker Store Emporium')
    @file_to_import.close
    @file_to_import
  end

  it 'given a file import the data and create 4 clients' do
    expect{ FileImport.call(file_upload: FileUpload.create, file: file_to_import) }.to change(Client, :count).by(4)
  end

  it 'given a file import the data and create 3 merchants' do
    expect{ FileImport.call(file_upload: FileUpload.create, file: file_to_import) }.to change(Merchant, :count).by(3)
  end

  it 'given a file import the data and create 3 items' do
    expect{ FileImport.call(file_upload: FileUpload.create, file: file_to_import) }.to change(Item, :count).by(3)
  end

  it 'given a file import the data and create 3 addresses' do
    expect{ FileImport.call(file_upload: FileUpload.create, file: file_to_import) }.to change(Address, :count).by(3)
  end

  it 'given a file import the data and create 4 item purchases' do
    expect{ FileImport.call(file_upload: FileUpload.create, file: file_to_import) }.to change(ItemPurchase, :count).by(4)
  end

  it 'given a file import the data and create 4 purchases' do
    expect{ FileImport.call(file_upload: FileUpload.create, file: file_to_import) }.to change(Purchase, :count).by(4)
  end
end

# purchaser name			item description		    	item price	  purchase count			merchant address			merchant name
# João Silva  				R$10 off R$20 of food		  10.0				  2						        987 Fake St					  Bob's Pizza
# Amy Pond	    			R$30 of awesome for R$10	10.0	 			  5						        456 Unreal Rd				  Tom's Awesome Shop
# Marty McFly	  			R$20 Sneakers for R$5		  5.0					  1						        123 Fake St					  Sneaker Store Emporium
# Snake Plissken			R$20 Sneakers for R$5		  5.0					  4						        123 Fake St					  Sneaker Store Emporium
