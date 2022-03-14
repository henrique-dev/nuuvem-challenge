class CreateFileUploads < ActiveRecord::Migration[7.0]
  def change
    create_table :file_uploads do |t|
      t.decimal :total

      t.timestamps
    end
  end
end
