class AddColumnToAlkohol < ActiveRecord::Migration
  def change
    add_column :alkohols, :type, :string
  end
end
