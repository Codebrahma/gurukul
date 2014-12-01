class CreateUserCourseStatuses < ActiveRecord::Migration
  def change
    create_table :user_course_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
