class AddCreatedbyToNotes < ActiveRecord::Migration
  def self.up
    add_column :notes, :created_by, :string
  end

  def self.down
    remove_column :notes, :created_by
  end
end
