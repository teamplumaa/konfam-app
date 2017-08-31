class AddAttachmentImageToServicephotos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :service_photos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :service_photos, :image
  end
end
