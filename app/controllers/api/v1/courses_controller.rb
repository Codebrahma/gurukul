class Api::V1::CoursesController < Api::V1::ApiController

  before_filter :default_params, only: [:index]

  def index
    render json: Course.all, status: 200
  end

  def show
    
  end

  def create
    
  end

  def update
    
  end

  def destroy
    
  end

  private
  def create_params
    params.permit(:name, :content, :description)
  end
end
