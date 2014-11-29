class TestReport < ActiveRecord::Base

  # Associations
	belongs_to :user_course
	belongs_to :test

end
