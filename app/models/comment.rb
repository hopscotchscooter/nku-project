class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  has_many :comment_votes
  
  def self.by_votes
      select('comments.*, coalesce(score, 0) as votes').
      joins('left join comment_votes on comment_id=comments.id').
      order('votes desc')
  end
  
  def votes
   comment_votes.sum('score')
  end
end
