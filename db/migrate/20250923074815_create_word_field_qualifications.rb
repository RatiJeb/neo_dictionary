class CreateWordFieldQualifications < ActiveRecord::Migration[8.0]
  def change
    create_table :word_field_qualifications do |t|
      t.references :word
      t.references :field_qualification
    end

    Word.all.each do |word|
      WordFieldQualification.create(word:, field_qualification_id: word.field_qualification_id)
    end
  end
end
