# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  name       :string(255)


class Page < ActiveRecord::Base
  # attr_accessible :title, :body

  has_many :widgets
end
 
