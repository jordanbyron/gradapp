class AddRequirementValueToApplicantRequirement < ActiveRecord::Migration
  def self.up
    add_column :applicant_requirements, :requirement_value, :string
  end

  def self.down
    remove_column :applicant_requirements, :requirement_value
  end
end
