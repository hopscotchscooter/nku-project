class AddGameIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :game, index: true
  end
end
