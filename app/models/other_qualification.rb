# == Schema Information
#
# Table name: other_qualifications
#
#  id            :bigint           not null, primary key
#  deleted_at    :datetime
#  en_name       :string
#  en_short_name :string
#  name          :string           not null
#  short_name    :string           not null
#
# Indexes
#
#  index_other_qualifications_on_deleted_at  (deleted_at)
#  index_other_qualifications_on_name        (name) UNIQUE
#  index_other_qualifications_on_short_name  (short_name) UNIQUE
#
class OtherQualification < ApplicationRecord
  include SoftDeletable
  validates :name, :short_name, presence: true
end
