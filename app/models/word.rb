# == Schema Information
#
# Table name: words
#
#  id                         :bigint           not null, primary key
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
#  index_words_on_field_qualification_id      (field_qualification_id)
#  index_words_on_grammar_qualification_id    (grammar_qualification_id)
#  index_words_on_stylistic_qualification_id  (stylistic_qualification_id)
#
class Word < ApplicationRecord
  has_many :explanations, dependent: :destroy
  has_many :examples, through: :explanations, dependent: :destroy
  belongs_to :stylistic_qualification, optional: true
  belongs_to :grammar_qualification, optional: true
  belongs_to :field_qualification, optional: true

  has_rich_text :etymology
  has_rich_text :note

  accepts_nested_attributes_for :explanations, allow_destroy: true

  validates :word, presence: true
end
