# == Schema Information
#
# Table name: other_qualifications
#
#  id            :bigint           not null, primary key
#  en_name       :string
#  en_short_name :string
#  name          :string           not null
#  short_name    :string           not null
#
# Indexes
#
#  index_other_qualifications_on_name        (name) UNIQUE
#  index_other_qualifications_on_short_name  (short_name) UNIQUE
#
require 'rails_helper'

RSpec.describe OtherQualification, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
