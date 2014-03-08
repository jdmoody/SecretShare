# == Schema Information
#
# Table name: secret_taggings
#
#  id         :integer          not null, primary key
#  secret_id  :integer
#  tag_id     :integer
#  created_at :datetime
#  updated_at :datetime
#

class SecretTagging < ActiveRecord::Base
  validates :secret, :tag_id, presence: true

  belongs_to :secret
  belongs_to :tag
end
