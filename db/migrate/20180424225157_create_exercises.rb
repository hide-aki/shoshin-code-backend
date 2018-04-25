class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.string :e_id
      t.string :name
      t.string :slug
      t.string :category
      t.string :url
      t.text :rank
      t.text :description
      t.integer :totalStars
      t.integer :voteScore
      t.text :tags

      t.timestamps
    end
  end
end
 