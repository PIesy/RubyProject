class CreateAlkohols < ActiveRecord::Migration
  def change
    create_table :alkohols do |t|
      t.string :name
      t.string :image_uid
      t.string :image_name
      t.float :percentage
      t.float :volume
      t.integer :bottle_type
      t.integer :count
      t.belongs_to :event
      t.belongs_to :user

      t.timestamps
    end
  end
end
