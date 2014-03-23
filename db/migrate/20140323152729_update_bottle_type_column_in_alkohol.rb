class UpdateBottleTypeColumnInAlkohol < ActiveRecord::Migration
  def change
    remove_column :alkohols, :bottle_type
    add_column :alkohols, :bottle_type, :string
  end
end
