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
