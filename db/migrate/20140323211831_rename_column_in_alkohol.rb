class RenameColumnInAlkohol < ActiveRecord::Migration
  def change
    remove_column :alkohols, :type
    add_column :alkohols, :drink_type, :string
  end
end
