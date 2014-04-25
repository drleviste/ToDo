class AddChecklistRefToItems < ActiveRecord::Migration
  def change
    add_reference :items, :checklist, index: true
  end
end
