class RenameTypeColumnFromBeast < ActiveRecord::Migration[5.2]
  def change
    rename_column :beasts, :type, :species
  end
end
