class ContentWidget < Widget 

	def get_view
		return "content_widget"
	end

	#set up the form elements for displaying a Content Widget
	def process(params)
    self.name = params[:widget][:name]
    self.html_block_1 = params[:widget][:html_block_1]
  end

  #nothing meaningful returned for this widget
  def get_data
		name = "content_widget"  #+ self.id.to_s
		datafields = {}
		return name.to_sym, datafields
	end
end