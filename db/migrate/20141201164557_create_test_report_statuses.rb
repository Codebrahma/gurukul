class CreateTestReportStatuses < ActiveRecord::Migration
  def change
    create_table :test_report_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
