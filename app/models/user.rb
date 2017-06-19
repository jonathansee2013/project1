# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  email           :string
#  password        :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_many :properties
  has_many :reviews
  has_secure_password
  # has_many :images, through: :properties
  validates :email, presence: true, uniqueness: true, length: {minimum: 5}
  validates :username, presence: true
end
