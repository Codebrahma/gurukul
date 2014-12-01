class UserCourseStatus < ActiveRecord::Base
  # Associations
  has_many :user_courses

  # Constant Column 'status'
  # Example: UserCourseStatus.ready_for_test
  # UserCourseStatus.ready_for_test.user_courses ( Lists all the user_courses which are ready for test )
  constantize_column :status
end
