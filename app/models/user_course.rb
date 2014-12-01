class UserCourse < ActiveRecord::Base
  
	# Associations
	has_many :test_reports
	belongs_to :user
	belongs_to :course
  belongs_to :user_course_status
  
end
