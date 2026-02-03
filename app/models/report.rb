class Report < ApplicationRecord
  belongs_to :monitor, polymorphic: true
  store_accessor :info, :status_code
end
