class CreateExamples < ActiveRecord::Migration[8.0]
  def change
    create_table :examples do |t|
      t.references :explanation, foreign_key: true, null: false, index: true
      t.integer :order
    end
  end
end
