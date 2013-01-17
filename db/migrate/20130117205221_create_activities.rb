class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.datetime :date
      t.string :address
      t.text :description
      t.string :link
      t.float :rating
      t.boolean :complete
      t.references :trip_element, :polymorphic => true

      t.timestamps
    end
  end
end
