class AddCourseDescriptionToCourse < ActiveRecord::Migration
  def change
    add_column :courses, :description, :text, :limit => 140
  end
end
