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

  belongs_to :friender,
    class_name: "User",
    foreign_key: :out_friend_id

  belongs_to :friendee,
    class_name: "User",
    foreign_key: :in_friend_id

  def self.can_friend(out_friend_id, in_friend_id)
    return false if out_friend_id == in_friend_id
    return !Friendship.exists?(out_friend_id: out_friend_id,
                               in_friend_id: in_friend_id)
  end

  def self.can_unfriend(out_friend_id, in_friend_id)
    return false if out_friend_id == in_friend_id
    return Friendship.exists?(out_friend_id: out_friend_id,
                               in_friend_id: in_friend_id)
  end
end