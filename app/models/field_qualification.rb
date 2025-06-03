class FieldQualification < ApplicationRecord
  has_many :words, dependent: :nullify
  validates :name, :short_name, presence: true
end
