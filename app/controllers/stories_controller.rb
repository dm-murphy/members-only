class StoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = current_user.stories.build
  end

  def create
    @story = current_user.stories.build(story_params)

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
