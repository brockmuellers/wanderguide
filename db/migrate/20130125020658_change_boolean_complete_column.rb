class ChangeBooleanCompleteColumn < ActiveRecord::Migration
  def change
    change_column :trips, :complete, :boolean, :null => true
    change_column :trips, :complete, :boolean, :default => false
  end
end
