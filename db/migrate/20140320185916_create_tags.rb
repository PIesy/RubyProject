class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :body

      t.timestamps
    end

    create_table :events_tags do |e|
      e.belongs_to :event
      e.belongs_to :tag
    end
  end
end
