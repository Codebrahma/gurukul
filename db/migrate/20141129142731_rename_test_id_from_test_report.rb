class RenameTestIdFromTestReport < ActiveRecord::Migration
  def change
    rename_column :test_reports, :test_id, :course_test_id
  end
end
