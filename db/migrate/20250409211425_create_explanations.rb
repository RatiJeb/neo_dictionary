class CreateExplanations < ActiveRecord::Migration[8.0]
  def change
    create_table :explanations do |t|
      t.references :word, foreign_key: true, null: false, index: true
      t.integer :order
    end
  end
end
