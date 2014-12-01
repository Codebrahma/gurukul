class TestReport < ActiveRecord::Base

  # Associations
	belongs_to :user_course
	belongs_to :course_test
  belongs_to :test_report_status

end
