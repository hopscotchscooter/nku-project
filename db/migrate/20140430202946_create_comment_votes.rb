class CreateCommentVotes < ActiveRecord::Migration
  def change
    create_table :comment_votes do |t|
      t.references :comment, index: true
      t.references :user, index: true
      t.integer :score

      t.timestamps
    end
    change_column_default :comment_votes, :score, default:0
  end
end
