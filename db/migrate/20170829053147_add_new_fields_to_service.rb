class AddNewFieldsToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :user_id, :integer
  end
end
