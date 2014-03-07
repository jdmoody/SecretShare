# == Schema Information
#
# Table name: friendships
#
#  id            :integer          not null, primary key
#  out_friend_id :integer          not null
#  in_friend_id  :integer          not null
#  created_at    :datetime
#  updated_at    :datetime
#

class Friendship < ActiveRecord::Base
  validates :out_friend_id, :in_friend_id, presence: true

  def self.can_friend(out_friend_id, in_friend_id)
    return false if out_friend_id == in_friend_id
    return !Friendship.exists?(out_friend_id: out_friend_id,
                               in_friend_id: in_friend_id)
  end
end