

# == Schema Information
#
# Table name: blobs
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Blob < ActiveRecord::Base
  # attr_accessible :title, :body
end
