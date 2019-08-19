class CreateBeasts < ActiveRecord::Migration[5.2]
  def change
    create_table :beasts do |t|
      t.string :name
      t.string :description
      t.string :address
      t.integer :dangerosity
      t.integer :price
      t.string :type

      t.timestamps
    end
  end
end
