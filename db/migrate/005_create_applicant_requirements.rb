diclass CreateApplicantRequirements < ActiveRecord::Migration
  def self.up
    create_table :applicant_requirements do |t|
      t.integer :requirement_id
      t.boolean :met
      t.string :applicant

      t.timestamps
    end
  end

  def self.down
    drop_table :applicant_requirements
  end
end
