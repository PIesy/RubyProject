class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :soundcloud_url
      t.string :name
      t.belongs_to :event

      t.timestamps
    end
  end
end
