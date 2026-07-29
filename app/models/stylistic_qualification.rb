# == Schema Information
#
# Table name: stylistic_qualifications
#
#  id            :bigint           not null, primary key
#  en_name       :string
#  en_short_name :string
#  name          :string           not null
#  short_name    :string           not null
#
# Indexes
#
#  index_stylistic_qualifications_on_name        (name) UNIQUE
#  index_stylistic_qualifications_on_short_name  (short_name) UNIQUE
#
class StylisticQualification < ApplicationRecord
  has_many :words, dependent: :nullify
  validates :name, :short_name, presence: true
end
