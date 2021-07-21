class StoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)

    if @story.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
    def story_params
      params.require(:story).permit(:title, :body)
    end
end
