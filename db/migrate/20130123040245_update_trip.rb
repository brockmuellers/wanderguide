class UpdateTrip < ActiveRecord::Migration
  def change
    change_column_null :trips, :complete, false, false
    add_column :trips, :budget, :integer
  end
end
