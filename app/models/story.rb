# == Schema Information
#
# Table name: stories
#
#  id                :integer          not null, primary key
#  title             :string(255)
#  author_first_name :string(255)
#  author_last_name  :string(255)
#  copyright_info    :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  image             :string(255)
#

class Story < ActiveRecord::Base
	has_many :pages
  attr_accessible :image, :title, :author_first_name, :author_last_name, :copyright_info
  mount_uploader :image, ImageUploader
end
