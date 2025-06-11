# == Schema Information
#
# Table name: grammar_qualifications
#
#  id            :bigint           not null, primary key
#  en_name       :string
#  en_short_name :string
#  name          :string           not null
#  short_name    :string           not null
#
# Indexes
#
#  index_grammar_qualifications_on_name        (name) UNIQUE
#  index_grammar_qualifications_on_short_name  (short_name) UNIQUE
#
class GrammarQualification < ApplicationRecord
  has_many :words, dependent: :nullify
  validates :name, :short_name, presence: true
end
