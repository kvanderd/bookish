class StoriesController < ApplicationController
  
  def index
  	@story = Story.new()
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
  end
  
end