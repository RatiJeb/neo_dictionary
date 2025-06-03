class Example < ApplicationRecord
  belongs_to :explanation
  has_rich_text :value
end
