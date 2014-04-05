class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.string :platform
      t.date :release

      t.timestamps
    end
  end
end
