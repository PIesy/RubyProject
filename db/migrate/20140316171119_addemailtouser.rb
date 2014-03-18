class Addemailtouser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at

      add_index :users, :confirmation_token,   :unique => true
    end
  end
end
