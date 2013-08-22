class WidgetsController < ApplicationController


  def new
  	@widget = Widget.new
    session[:page_id] = params[:id]
    #call the widget's custom initiation code, which varies from widget to widget.
    @widget.init_data
    @widget.save
  end

  def index
    @widgets = Widget.all
  end

	def destroy
   @widget= Widget.find(params[:id])
   @widget.destroy
   redirect_to :controller => "pages",  :action => "show", :id => session[:page_id]
  end

  def show
     raise "show method in Widget Controller called. refactor."
  	 @widget= Widget.find(params[:id]) 
     redirect_to :controller => "pages",  :action => "show", :id => session[:page_id] 

  end

  def edit
    @widget= Widget.find(params[:id])
    @story_id = session[:story_id]
    session[:page_id] = @widget.page_id

    #load any additional data that the view will need
    @widget.get_data
    view_path = calc_view("edit")
    raise "unable to derive an edit view path for this class" if !view_path
    render view_path
  end

  def update
    @widget = Widget.find(params[:id]) 
    #call the appropriate widget model to store widget-specific data.
    @widget.set_data(params)
    if @widget.save
      redirect_to story_page_path(:story_id => session[:story_id], :id => session[:page_id])
      #:controller => "pages",  :action => "show", :id => session[:story_id]
    else raise "update of widget failed"
    end
  end

  #each different type of widget can have its own view. We get the name of the view from the widget itself.
  def calc_view(action)
    view_path = @widget.get_view
    if view_path
      #perhaps use pluralize here?
      view_path << "s/" <<action
      return view_path
    else return nil
    end
  end

end
