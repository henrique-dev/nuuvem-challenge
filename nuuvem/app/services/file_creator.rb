# frozen_string_literal: true

# Documentation
class FileCreator < ApplicationService

  def initialize(files:)
    @files = files
  end

  def call
    create_files
  end

  def create_files
    @files.each do |file_data|
      if file_data.respond_to?(:read)
        f = FileUpload.create(purchase_data: file_data)
        if Rails.env.test?
          CreatePurchasesJob.new.perform f.id.to_s
        else
          CreatePurchasesJob.perform_later f.id.to_s
        end
      end
    end
  end
end
