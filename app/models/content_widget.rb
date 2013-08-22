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

class ContentWidget < Widget 

	def get_view
		return "content_widget"
	end

	#set up the form elements for displaying a Content Widget
	def process(params)
    self.name = params[:widget][:name]
    debugger
    self.data = params[:widget][:data]
  end

	 #each different class of widget initializes the base widget "data" attribute
  #by defining any necessary items.
	def init_data
		self.data[:content_widget]= {}
		d = self.data[:content_widget]
		d[:html_block_1]=""
	
	end

	def set_data(params)	
		self.data[:content_widget][:html_block_1] = params[:html_block_1]
	end

	def get_data()	
	end
end
