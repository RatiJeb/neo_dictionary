# == Schema Information
#
# Table name: search_tags
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  word_id    :bigint           not null
#
# Indexes
#
#  index_search_tags_on_name              (name)
#  index_search_tags_on_word_id           (word_id)
#  index_search_tags_on_word_id_and_name  (word_id,name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (word_id => words.id)
#
class SearchTag < ApplicationRecord
  belongs_to :word

  before_validation :strip_name

  validates :name, presence: true, uniqueness: { scope: :word_id }

  private

  def strip_name
    self.name = name.to_s.strip
  end
end
