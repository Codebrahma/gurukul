class User < ActiveRecord::Base

	# Associations
	has_many :user_courses
	has_many :courses, :through => :user_courses
	has_many :tests, :through => :courses
	has_many :test_reports, :through => :user_courses

	# Validations
	validate :name, :presence => true
	
end
