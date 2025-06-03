class Explanation < ApplicationRecord
  belongs_to :word
  has_many :examples, dependent: :destroy
  has_rich_text :value

  accepts_nested_attributes_for :examples, allow_destroy: true
end
