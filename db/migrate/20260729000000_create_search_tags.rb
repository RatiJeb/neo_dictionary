class CreateSearchTags < ActiveRecord::Migration[8.0]
  def change
    create_table :search_tags do |t|
      t.references :word, null: false, foreign_key: true
      t.string :name, null: false

      t.timestamps
    end

    add_index :search_tags, :name
    add_index :search_tags, [ :word_id, :name ], unique: true
  end
end
