# == Schema Information
#
# Table name: explanations
#
#  id      :bigint           not null, primary key
#  order   :integer
#  word_id :bigint           not null
#
# Indexes
#
#  index_explanations_on_word_id  (word_id)
#
# Foreign Keys
#
#  fk_rails_...  (word_id => words.id)
#
class Explanation < ApplicationRecord
  belongs_to :word
  has_many :examples, dependent: :destroy
  has_rich_text :value

  accepts_nested_attributes_for :examples, allow_destroy: true
end
