class AddTestReportStatusToTestReport < ActiveRecord::Migration
  def change
    add_reference :test_reports, :test_report_status, index: true
  end
end
