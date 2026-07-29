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
require 'rails_helper'

RSpec.describe WordFieldQualification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
