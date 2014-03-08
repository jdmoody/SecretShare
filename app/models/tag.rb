# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Tag < ActiveRecord::Base
  validates :name, presence: true

  has_many :secret_taggings, inverse_of: :tag
  has_many :secrets, through: :secret_taggings
end