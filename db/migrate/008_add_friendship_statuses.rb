class AddFriendshipStatuses < ActiveRecord::Migration
  def self.up
    FriendshipStatus.create :name => "pending"
    FriendshipStatus.create :name => "accepted"
  end

  def self.down
    FriendshipStatus.destroy_all
  end
end
