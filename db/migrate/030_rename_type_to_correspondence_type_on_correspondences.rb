class RenameTypeToCorrespondenceTypeOnCorrespondences < ActiveRecord::Migration
  def self.up
    rename_column "correspondences", "type", "correspondence_type"
  end

  def self.down
    rename_column "correspondences", "correspondence_type", "type"
  end
end
