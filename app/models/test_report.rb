class TestReport < ActiveRecord::Base

  # Associations
	belongs_to :user_course
	belongs_to :course_test

end
