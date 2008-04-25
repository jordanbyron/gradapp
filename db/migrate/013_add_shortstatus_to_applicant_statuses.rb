class AddShortstatusToApplicantStatuses < ActiveRecord::Migration
  def self.up
    add_column :applicant_statuses, :short_status, :string
  end

  def self.down
    remove_column :applicant_statuses, :short_status
  end
end
