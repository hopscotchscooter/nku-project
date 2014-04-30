class AddDefaultToScore < ActiveRecord::Migration
  def change
    change_column_default(:ratings, :score, 0)
  end
end
