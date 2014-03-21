class RemoveUnusedColumns < ActiveRecord::Migration
  def change
    remove_column :events, :owner
    remove_column :comments, :date
  end
end
