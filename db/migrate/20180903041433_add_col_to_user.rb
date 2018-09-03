class AddColToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :dob, :date
    add_column :users, :address, :string
    add_column :users, :phone, :integer
  end
end
