class CreateOtherQualifications < ActiveRecord::Migration[8.0]
  def change
    create_table :other_qualifications do |t|
      t.string :short_name, null: false
      t.string :name, null: false
      t.string :en_name
      t.string :en_short_name
    end

    add_index :other_qualifications, :short_name, unique: true
    add_index :other_qualifications, :name, unique: true
  end
end
