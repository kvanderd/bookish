class StoriesController < ApplicationController
  
  def index
  	@story = Story.new()
  end

  def new
  	@story = Story.create()
  end
  
end