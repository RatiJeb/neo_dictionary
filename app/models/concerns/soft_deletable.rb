# frozen_string_literal: true

module SoftDeletable
  extend ActiveSupport::Concern
  included do
    default_scope -> { where(deleted_at: nil) }

    def soft_delete
      update(deleted_at: Time.current)
    end

    def soft_restore
      update(deleted_at: nil)
    end
  end
end
