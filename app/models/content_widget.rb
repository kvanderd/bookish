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

	#each different class of widget initializes the base widget "data" attribute
  #by defining any necessary items.
	def init_data
		classhash = self.data[:content_widget] = {}
		classhash[:html_block_1]=""
	end

	#a widget's set_data method is called in update methods, to map params to the appropriate parts of the data hash
	def set_data(params)	
		self.data[:content_widget][:html_block_1] = params[:html_block_1]
	end

	#called in edit and show methods to grab any data that the view needs that isn't already in the data hash
	#an example: an updated list of Pages for a Story view.
	def get_data()	
	end

  #called in edit and show methods to find the correct view erb file
	def get_view
		return "content_widget"
	end
end
