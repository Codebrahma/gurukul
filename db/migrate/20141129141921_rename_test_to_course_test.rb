class RenameTestToCourseTest < ActiveRecord::Migration
  def change
    rename_table :tests, :course_tests
  end
end
