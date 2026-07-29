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
require 'rails_helper'

RSpec.describe SearchTag, type: :model do
  it "requires a name" do
    search_tag = described_class.new(word: Word.new(word: "test"))

    expect(search_tag).not_to be_valid
    expect(search_tag.errors[:name]).to be_present
  end
end
