# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  comment    :text
#  rating     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Review < ApplicationRecord
  belongs_to :property, optional: true
  belongs_to :user, optional: true

end
