class Course < ActiveRecord::Base

	# Associations
	has_many :tests
	has_many :user_courses
	has_many :users, :through => :user_courses

	# Validations
	validate :name, :presence => true

	# Constant Column 'name'
	# Example: Course.javascript
	constantize_column :name
		
end
