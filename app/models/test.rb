class Test < ActiveRecord::Base
	has_many :test_reports
  belongs_to :course
end
