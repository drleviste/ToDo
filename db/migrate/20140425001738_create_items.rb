class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.text :content
      t.string :category
      t.integer :order
      t.boolean :is_complete

      t.timestamps
    end
  end
end
