# frozen_string_literal: true

# == Schema Information
#
# Table name: word_field_qualifications
#
#  id                     :bigint           not null, primary key
#  field_qualification_id :bigint
#  word_id                :bigint
#
# Indexes
#
#  index_word_field_qualifications_on_field_qualification_id  (field_qualification_id)
#  index_word_field_qualifications_on_word_id                 (word_id)
#
class WordFieldQualification < ApplicationRecord
  belongs_to :word
  belongs_to :field_qualification
end
