class AddGooglePlaceFieldsToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :reference, :string
    add_column :locations, :latitude, :string
    add_column :locations, :longitude, :string
  end
end
