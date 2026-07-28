# == Schema Information
#
# Table name: words
#
#  id                         :bigint           not null, primary key
#  deleted_at                 :datetime
#  english_translation        :string
#  transliteration            :string
#  word                       :string           not null
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  field_qualification_id     :bigint
#  grammar_qualification_id   :bigint
#  stylistic_qualification_id :bigint
#
# Indexes
#
#  idx_english_translation_trigram            (english_translation) USING gin
#  idx_word_trigram                           (word) USING gin
#  index_words_on_deleted_at                  (deleted_at)
#  index_words_on_field_qualification_id      (field_qualification_id)
#  index_words_on_grammar_qualification_id    (grammar_qualification_id)
#  index_words_on_stylistic_qualification_id  (stylistic_qualification_id)
#
require 'rails_helper'

RSpec.describe Word, type: :model do
  describe "search tags" do
    it "creates and removes search tags through nested attributes" do
      word = described_class.create!(
        word: "neo",
        search_tags_attributes: {
          "0" => { name: "new, modern" },
          "1" => { name: "fresh" }
        }
      )

      expect(word.search_tags.pluck(:name)).to contain_exactly("new, modern", "fresh")

      word.update!(
        search_tags_attributes: {
          "0" => { id: word.search_tags.find_by!(name: "new, modern").id, _destroy: "1" }
        }
      )

      expect(word.search_tags.reload.pluck(:name)).to contain_exactly("fresh")
    end
  end
end
