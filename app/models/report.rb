class Report < ApplicationRecord
  belongs_to :monitor, polymorphic: true
  store_accessor :info, :status_code # Should have been called response_body

  scope :up, -> { where(up: true) }
  scope :down, -> { where(up: false) }
end
