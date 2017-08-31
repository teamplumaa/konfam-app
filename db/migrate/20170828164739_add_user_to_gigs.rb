class AddUserToGigs < ActiveRecord::Migration[5.1]
  def change
    add_column :gigs, :user_id, :integer
  end
end
