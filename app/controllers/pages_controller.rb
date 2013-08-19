class PagesController < ApplicationController

  def new
    
    @story = Story.where(id: params["story_id"])
    if params["commit"] == "Save Page"
      #we're saving a set of page data that has just been created
		  @page = Page.new()
    
      @page.name = params[:page][:name]
      @page.story_id = params[:story_id]
      if @page.save
        session[:page_id] = @page.id
        flash[:notice] = "Page: #{@page.name} was successfully created."
        redirect_to action: 'index'
      else
      	raise ("failed to save a page")
      end
    else
      #we're rendering a blank form for a new page
      @page = Page.new()
    end
  end

  def index
    @story = Story.find(params["story_id"])
  end

  def destroy
   @page = Page.find(params[:id])
   @page.destroy
   redirect_to :action => "index"
  end


  def create
    raise ("shouldn't be here. this functionality was merged into the 'new' method")
  end

  #needs to be rethought, perhaps merged with show
  def edit
  	redirect_to action: "show"
  	
  end

	def show
		@page = Page.find(params[:id])
		# @widgets_list = Widget.where(page_id:params[:id])
    # session[:page_id] = params[:id]
	end

	
end
