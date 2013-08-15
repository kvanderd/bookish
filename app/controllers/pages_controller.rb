class PagesController < ApplicationController

	def new
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
        session[:set_id] = @page.id
        flash[:notice] = "Page: #{@page.name} was successfully created."
        redirect_to action: 'index'
      else
      	raise ("failed to save a page")
      end
  end

  #needs to be rethought
  def edit
  	@page = Page.find(params[:id])
  	@widgets_list = Widget.where(page_id:  params[:id])
  	@widgets.each do |widget|
  			widget.configure
  	end
  	flash[:notice] = "Page: #{@page.name} was configured."
    redirect_to action: 'index'
  end

	def show
		@page = Page.find(params[:id])
		@widgets = Widget.where(page_id:  params[:id])
    session[:set_id] = params[:id]
	end

	
end
