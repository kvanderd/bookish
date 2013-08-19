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
