class UserCourse < ActiveRecord::Base
	has_many :test_reports
  belongs_to :user
  belongs_to :course
end
