class CourseTest < ActiveRecord::Base

	# Associations
	has_many :test_reports
	belongs_to :course

	# Validations
	validate :name, :presence => true
	
end
