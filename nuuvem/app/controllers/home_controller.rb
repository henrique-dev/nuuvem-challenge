class HomeController < ApplicationController

  def index
    @last_total = format('%.2f', (FileUpload.last&.total || '0.00'))
    @total = format('%.2f', (FileUpload.sum(:total) || '0.00'))
    @item_purchases = ItemPurchase.page(params[:page])
  end

  def import_file
    FileCreator.call(files: post_params)
    redirect_to action: :index
  # rescue StandardError => e
  #   @messages = [
  #     { e.class => e.to_s }
  #   ]
  #   redirect_to action: :index
  end

  private

  def post_params
    params.require(:uploaded_file).require(:attachment)
  end

end
