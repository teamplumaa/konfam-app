class CreateGigs < ActiveRecord::Migration[5.1]
  def change
    create_table :gigs do |t|
      t.string :category
      t.string :title
      t.string :description
      t.string :location
      t.date :date
      t.time :time
      t.integer :personnel_count
      t.integer :compensation
      t.string :additional_details

      t.timestamps
    end
  end
end
