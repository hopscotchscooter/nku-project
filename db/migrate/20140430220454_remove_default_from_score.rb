class RemoveDefaultFromScore < ActiveRecord::Migration
  def change
    change_column_default(:comment_votes, :score, nil)
  end
end
