class CreateEventAttendants < ActiveRecord::Migration
  def change
    create_table :event_attendants do |t|
      t.belongs_to :event
      t.belongs_to :user
      t.timestamps
    end
  end
end
