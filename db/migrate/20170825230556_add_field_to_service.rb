class AddFieldToService < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :service_category, :string
  end
end
