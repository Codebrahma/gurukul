class TestReportStatus < ActiveRecord::Base
  # Associations
  has_many :test_reports

  constantize_column :status
end
