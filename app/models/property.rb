# == Schema Information
#
# Table name: properties
#
#  id          :integer          not null, primary key
#  address     :text
#  suburb      :text
#  state       :text
#  postcode    :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Property < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews
  has_many :images
end
