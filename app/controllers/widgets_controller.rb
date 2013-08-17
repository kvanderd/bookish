class WidgetsController < ApplicationController

  def new
  	@widget = Widget.new
    session[:page_id] = params[:page_id]
  end

  def index
      @widgets = Widget.all
  end

  #There are many different types of widgets, such as blobs and widgets. We track them all in the 
  #widgets table using STI. 
	def create	
		@widget = Widget.new

    #TODO: probably move this to model
    #find the classtype from the list of definitions in the WidgetTemplate table
    factory = WidgetTemplate.find(params[:widget_template][:factory_id])
  
    #storing the classtype in a column called "type" enables STI
    @widget.type = factory.classtype
    #set the friendly name of the widget
    @widget.name = factory.name    
    @widget.add_to_page(session[:page_id])
		@widget.save

    #each different kind of widget can have its own view. We get the name of the view from the widget itself.
    view_path = calc_view("new")
    raise "unable to derive a view path for this class" if !view_path
    render view_path
	end

	def destroy
   @widget= Widget.find(params[:id])
   @widget.destroy
   redirect_to :controller => "pages",  :action => "show", :id => session[:page_id]
  end

  def show
  	 @widget= Widget.find(params[:id]) 

     view_path = calc_view("show")
     raise "unable to derive a view path for this class" if !view_path
     render view_path
     
  end

  def edit
    @widget= Widget.find(params[:id])
     view_path = calc_view("edit")
     raise "unable to derive an edit view path for this class" if !view_path
     render view_path
  end

 

  def update
    @widget = Widget.find(params[:id]) 
    @widget.process(params)
    if @widget.save
      redirect_to @widget
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
