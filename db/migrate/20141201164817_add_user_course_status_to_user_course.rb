class AddUserCourseStatusToUserCourse < ActiveRecord::Migration
  def change
    add_reference :user_courses, :user_course_status, index: true
  end
end
