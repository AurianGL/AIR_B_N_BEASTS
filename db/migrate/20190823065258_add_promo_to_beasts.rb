class AddPromoToBeasts < ActiveRecord::Migration[5.2]
  def change
    add_column :beasts, :promo, :integer
  end
end
