# == Schema Information
#
# Table name: widgets
#
#  id           :integer          not null, primary key
#  html_block_1 :text
#  name         :string(255)
#  type         :string(255)
#  page_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

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
