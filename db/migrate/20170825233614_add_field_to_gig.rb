class AddFieldToGig < ActiveRecord::Migration[5.1]
  def change
    add_column :gigs, :active, :boolean
  end
end
