class AddItemColKind < ActiveRecord::Migration
  def change
    add_column :items, :kind, :string
  end
end
