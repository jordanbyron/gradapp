class AddPaginationPrefToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :pagination_pref, :integer
  end

  def self.down
    remove_column :users, :pagination_pref
  end
end
