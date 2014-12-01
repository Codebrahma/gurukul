require 'spec_helper'

describe UserCourseStatus do
  it { should have_many(:user_courses) }
end
