# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Image < ApplicationRecord
  belongs_to :property, optional: true
end
