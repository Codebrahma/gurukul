class CreateUserCourses < ActiveRecord::Migration
  def change
    create_table :user_courses do |t|
      t.references :user, index: true
      t.references :course, index: true

      t.timestamps
    end
  end
end
