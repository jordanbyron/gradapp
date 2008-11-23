class AddCreatedByToCorrespondence < ActiveRecord::Migration
  def self.up
    add_column :correspondences, :created_by, :string
  end

  def self.down
    remove_column :correspondences, :created_by
  end
end
