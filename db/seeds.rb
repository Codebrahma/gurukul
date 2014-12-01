# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

puts "Seeding User Course Status"

user_course_statuses = [
  "preparing",
  "ready_for_test",
  "test_in_progress",
  "evaluating",
  "completed",
  "failed"
]

user_course_statuses.each do | user_course_status |
  UserCourseStatus.create( :status => user_course_status )
end

puts "Seeding Test Report Status"

test_report_statuses = [
  "passed",
  "failed"
]

test_report_statuses.each do | test_report_status |
  TestReportStatus.create( :status => test_report_status )
end
