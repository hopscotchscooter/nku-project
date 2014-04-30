class RemoveWrongColumns < ActiveRecord::Migration
  def change
  end
  
  def self.up
    remove_column :rating, :default
  end
end
