class UpdateUser < ActiveRecord::Migration
  def change
    add_column :users, :about, :text
    add_column :users, :location, :text
    remove_column :users, :username
  end
end
