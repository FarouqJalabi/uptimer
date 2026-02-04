class Monitor::Base < ApplicationRecord
  self.abstract_class = true
  self.table_name_prefix = "monitor_"

  belongs_to :user
  has_many :reports, -> { order(:created_at) }, as: :monitor, dependent: :destroy

  validates_presence_of :name

  def build_report
    raise NotImplementedError
  end
end
