class User < ActiveRecord::Base
  has_many :games
  has_many :comments
  has_many :friendships
  has_many :comment_votes
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_secure_password 
   
  def avatar
    Avatar.from_user(self)
  end
  
  def total_votes
    CommentVote.joins(:comment).where(comments: {user_id: self.id}).sum('score')
  end
  
  def can_vote_for?(comment)
    comment_votes.build(score: 1, comment: comment).valid?
  end
end
