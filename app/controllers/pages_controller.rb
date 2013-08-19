class PagesController < ApplicationController

	def new
    @page = Page.new()
  end

  def index
		@pages = Page.all
	end

  def destroy
   @page = Page.find(params[:id])
   @page.destroy
   redirect_to :action => "index"
  end


	def create
		@page = Page.new()
    @page.name = params[:page][:name]
      if @page.save
        session[:page_id] = @page.id
        flash[:notice] = "Page: #{@page.name} was successfully created."
        redirect_to action: 'index'
      else
      	raise ("failed to save a page")
      end
  end

  #needs to be rethought, perhaps merged with show
  def edit
  	redirect_to action: "show"
  	
  end

	def show
		@page = Page.find(params[:id])
		@widgets_list = Widget.where(page_id:params[:id])
    session[:page_id] = params[:id]
	end

	
end
