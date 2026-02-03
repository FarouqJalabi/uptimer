class Monitor::Base < ApplicationRecord
  self.abstract_class = true
  self.table_name_prefix = "monitor_"

  # belongs_to :website
  has_many :reports, as: :monitor, dependent: :destroy

  def build_report
    raise NotImplementedError
  end

  def should_perform?
    raise NotImplementedError
  end
end
