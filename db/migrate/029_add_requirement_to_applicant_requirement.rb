class AddRequirementToApplicantRequirement < ActiveRecord::Migration
  def self.up
    add_column :applicant_requirements, :requirement, :string
  end

  def self.down
    remove_column :applicant_requirements, :requirement
  end
end
