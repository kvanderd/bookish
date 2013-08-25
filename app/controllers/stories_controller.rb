class StoriesController < ApplicationController
  
  def index
  	# @story = Story.new()
    @stories = Story.all
  end

  def new
    if current_user
  	  @story = Story.create!(user_id: current_user.id)
    else
      @story = Story.create!
    end
  end

  def update 
    @story = Story.create(params[:story])
      redirect_to story_path(@story.id)
  end

  def show
   @story = Story.find(params[:id])
   session[:story_id]=@story.id
   @pages = Page.where(story_id: @story.id)
  end
  
end