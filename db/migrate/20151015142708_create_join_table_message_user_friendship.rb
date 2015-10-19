class CreateJoinTableMessageUserFriendship < ActiveRecord::Migration
  def change
    create_join_table :messages, :user_friendships do |t|
      t.index :message_id
      t.index :user_friendship_id
    end
  end
end
