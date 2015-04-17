class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :campaign
      t.string :character

      t.timestamps null: false
    end
  end
end
