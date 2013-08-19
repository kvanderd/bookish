class StoriesController < ApplicationController
  
  def index
  	# @story = Story.new()
    @stories = Story.all
  end

  def new
  	@story = Story.create()
  end

  def update 
    @story = Story.create(params[:story])
      redirect_to story_path(@story.id)
  end

  def show
   @story = Story.find(params[:id])
   @pages = Page.where(story_id: @story.id)
  end
  
end