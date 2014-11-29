class CreateTestReports < ActiveRecord::Migration
  def change
    create_table :test_reports do |t|
      t.string :status
      t.references :user_course, index: true
      t.references :test, index: true

      t.timestamps
    end
  end
end
