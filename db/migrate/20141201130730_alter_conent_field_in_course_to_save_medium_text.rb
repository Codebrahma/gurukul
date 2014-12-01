class AlterConentFieldInCourseToSaveMediumText < ActiveRecord::Migration
  def change
    change_column :courses, :content, :text, :limit => 16777215
  end
end
