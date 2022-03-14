# frozen_string_literal: true

# Documentation
class CreatePurchasesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    return unless (file_upload = FileUpload.find(args[0]))

    sleep(2.seconds)
    FileImport.call(file_upload: file_upload)
  end
end
