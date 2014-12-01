class UserCourseStatus < ActiveRecord::Base
  # Associations
  has_many :user_courses

  # Constant Column 'status'
  # Example: UserCourseStatus.ReadyForTest
  # UserCourseStatus.ReadyForTest.user_courses ( Lists all the user_courses which are ready for test )
  constantize_column :status
end
