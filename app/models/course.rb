class Course < ActiveRecord::Base

	# Associations
	has_many :course_tests
	has_many :user_courses
	has_many :users, :through => :user_courses

	# Validations
	validates_presence_of :name

	# Constant Column 'name'
	# Example: Course.javascript
	constantize_column :name
		
end
