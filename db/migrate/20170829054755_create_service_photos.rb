class CreateServicePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :service_photos do |t|
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
