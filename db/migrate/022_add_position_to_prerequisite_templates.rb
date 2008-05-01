class AddPositionToPrerequisiteTemplates < ActiveRecord::Migration
  def self.up
    add_column :prerequisite_templates, :position, :integer
  end

  def self.down
    remove_column :prerequisite_templates, :position
  end
end
