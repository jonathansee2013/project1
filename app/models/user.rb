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
  enum user_type: [:landlord, :tenant, :admin]

  has_many :properties
  has_many :reviews
  has_secure_password
  # has_many :images, through: :properties
  validates :email, presence: true, uniqueness: true, length: {minimum: 5}
  validates :username, presence: true

  def is_landlord?
    user_type == "landlord"
  end

  def is_tenant?
    user_type == "tenant"
  end

  def is_admin?
    user_type == "admin"
  end

end
