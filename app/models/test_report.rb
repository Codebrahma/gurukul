class TestReport < ActiveRecord::Base
  belongs_to :user_course
  belongs_to :test
end
