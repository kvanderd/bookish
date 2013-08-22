# == Schema Information
#
# Table name: widgets
#
#  id         :integer          not null, primary key
#  data       :text
#  name       :string(255)
#  type       :string(255)
#  page_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ControlWidget < Widget 

  #each different class of widget initializes the base widget "data" attribute
  #by defining any necessary items.
		def init_data
		self.data[:control_widget]= {}
		d = self.data[:control_widget]
		d[:choice_1_label_1] = ""
		d[:choice_1_dest1_page_id] = ""
		d[:choice_2_label_1] = ""
		d[:choice_2_dest2_page_id] = ""
	end

  #a widget's set_data method is called in update methods, to map params to the appropriate parts of the data hash
	def set_data(params)
		#if this is the first time, need to initialize the hash
		if !self.data[:control_widget] then self.data[:control_widget] = {} end
		
		self.data[:control_widget][:choice_1_label_1] = params[:choice_1_label_1]
		self.data[:control_widget][:choice_1_dest1_page_id] = params[:choice_1_dest1_page_id]
		self.data[:control_widget][:choice_2_label_1] = params[:choice_2_label_1]
		self.data[:control_widget][:choice_2_dest2_page_id] = params[:choice_2_dest2_page_id]
	end

  #called in edit and show methods to grab any data that the view needs that isn't already in the data hash
	#an example: an updated list of Pages for a Story view.
	def get_data()
		self.data[:control_widget][:pages_list] = Page.all
	end

	#called in edit and show methods to find the correct view erb file
	def get_view
		return "control_widget"
	end

end
