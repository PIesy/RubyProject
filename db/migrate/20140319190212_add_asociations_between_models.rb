class AddAsociationsBetweenModels < ActiveRecord::Migration
  def change
    change_table :events do |events|
      events.belongs_to :user
    end

    change_table :comments do |comments|
      comments.belongs_to :user
      comments.belongs_to :event
    end
  end
end
