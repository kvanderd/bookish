class StoriesController < ApplicationController
  
  def index
  	# @story = Story.new()
    @stories = Story.all
  end

  def new
  	@story = Story.new()
  end

  def create
    if current_user
      @story = Story.create!(params[:story])
      user_love = current_user.id
      @story.user_id = current_user.id
      @story.save!
    else
      @story = Story.create!(params[:story])
    end
      redirect_to story_path(@story.id)
  end

  def update 
    if current_user
      @story = Story.create(params[:story], user_id: current_user.id)
    else
      @story = Story.create(params[:story])
    end
      redirect_to story_path(@story.id)
  end

  def show
   @story = Story.find(params[:id])
   session[:story_id]=@story.id
   @pages = Page.where(story_id: @story.id)
  end
  
end