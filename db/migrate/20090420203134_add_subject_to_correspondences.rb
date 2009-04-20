class AddSubjectToCorrespondences < ActiveRecord::Migration
  def self.up
    add_column :correspondences, :subject, :string
  end

  def self.down
    remove_column :correspondences, :subject
  end
end
