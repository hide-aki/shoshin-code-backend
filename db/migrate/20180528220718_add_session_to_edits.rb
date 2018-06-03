class AddSessionToEdits < ActiveRecord::Migration[5.2]
  def change
    add_column :edits, :session, :string
  end
end
