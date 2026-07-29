class AddFieldsToWord < ActiveRecord::Migration[8.0]
  def change
    create_table :grammar_qualifications do |t|
      t.string :short_name, null: false
      t.string :name, null: false
      t.string :en_name
      t.string :en_short_name
    end

    create_table :stylistic_qualifications do |t|
      t.string :short_name, null: false
      t.string :name, null: false
      t.string :en_name
      t.string :en_short_name
    end

    create_table :field_qualifications do |t|
      t.string :short_name, null: false
      t.string :name, null: false
      t.string :en_name
      t.string :en_short_name
    end

    add_index :grammar_qualifications, :short_name, unique: true
    add_index :grammar_qualifications, :name, unique: true
    add_index :stylistic_qualifications, :short_name, unique: true
    add_index :stylistic_qualifications, :name, unique: true
    add_index :field_qualifications, :short_name, unique: true
    add_index :field_qualifications, :name, unique: true

    add_column :words, :transliteration, :string
    add_reference :words, :grammar_qualification
    add_reference :words, :stylistic_qualification
    add_reference :words, :field_qualification
  end
end
