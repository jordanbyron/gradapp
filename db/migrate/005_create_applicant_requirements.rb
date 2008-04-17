class CreateApplicantRequirements < ActiveRecord::Migration
  def self.up
    create_table :applicant_requirements do |t|
      t.integer :application_requirement_id
      t.integer :graduate_applicant_id
      t.boolean :met

      t.timestamps
    end
  end

  def self.down
    drop_table :applicant_requirements
  end
end
