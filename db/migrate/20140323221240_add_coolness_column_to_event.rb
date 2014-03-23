class AddCoolnessColumnToEvent < ActiveRecord::Migration
  def change
    add_column :events, :coolness, :integer
  end
end
