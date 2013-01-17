class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.string :name
      t.datetime :date
      t.text :description
      t.boolean :complete
      t.float :rating
      t.text :diary
      t.references :trip_location, :polymorphic => true

      t.timestamps
    end
  end
end
