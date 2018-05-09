class CreateEdits < ActiveRecord::Migration[5.2]
  def change
    create_table :edits do |t|
      t.string :text
      t.string :sender_id
      t.timestamps
    end
  end
end
