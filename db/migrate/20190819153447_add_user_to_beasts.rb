class AddUserToBeasts < ActiveRecord::Migration[5.2]
  def change
    add_reference :beasts, :user, foreign_key: true
  end
end
