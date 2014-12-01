class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	# Associations
	has_many :user_courses
	has_many :courses, :through => :user_courses
	has_many :course_tests, :through => :courses
	has_many :test_reports, :through => :user_courses

	# Validations
	validates_presence_of :name
	
end
