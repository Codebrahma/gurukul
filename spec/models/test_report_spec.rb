require 'spec_helper'

describe TestReport do
  it { should belong_to(:course_test) }
  it { should belong_to(:user_course) }
end
