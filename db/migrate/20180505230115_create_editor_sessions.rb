class CreateEditorSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :editor_sessions do |t|
      t.integer :user_id
      t.integer :exercise_id
      t.text :editor_content
      t.timestamps
    end
  end
end
