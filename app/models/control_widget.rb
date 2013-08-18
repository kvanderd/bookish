class ControlWidget < Widget 


	def process(params)
			puts "foo"
	end

	def get_view
		return "control_widget"
	end

	#assemble data that this widget needs and send it off to be provided to a view
	def get_data
		name = "control_widget"  #+ self.id.to_s
		datafields = {}
		datafields[:pages_list] = Page.all
		return name.to_sym, datafields
	end

end