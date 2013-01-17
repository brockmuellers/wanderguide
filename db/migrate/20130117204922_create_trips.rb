class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :complete
      t.float :rating
      t.text :description
      t.string :category
      t.text :diary
      t.references :user

      t.timestamps
    end
  end
end
