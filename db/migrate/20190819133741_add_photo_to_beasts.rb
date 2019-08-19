class AddPhotoToBeasts < ActiveRecord::Migration[5.2]
  def change
    add_column :beasts, :photo, :string
  end
end
