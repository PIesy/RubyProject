class ManyToManyAsociations < ActiveRecord::Migration
  def change
    drop_table :events_tags

    create_table :events_tags, :id => false do |e|
      e.belongs_to :event
      e.belongs_to :tag
    end

  end
end
