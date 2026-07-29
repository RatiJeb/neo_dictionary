# == Schema Information
#
# Table name: examples
#
#  id             :bigint           not null, primary key
#  order          :integer
#  explanation_id :bigint           not null
#
# Indexes
#
#  index_examples_on_explanation_id  (explanation_id)
#
# Foreign Keys
#
#  fk_rails_...  (explanation_id => explanations.id)
#
class Example < ApplicationRecord
  belongs_to :explanation
  has_rich_text :value
end
