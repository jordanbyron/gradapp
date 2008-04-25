class CreateApplicantStatuses < ActiveRecord::Migration
  def self.up
    create_table :applicant_statuses do |t|
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :applicant_statuses
  end
end
