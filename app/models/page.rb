# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  story_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class Page < ActiveRecord::Base
  attr_accessible :id, :name, :story_id
  belongs_to :story
  has_many :widgets
end
 
