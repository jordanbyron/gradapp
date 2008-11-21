class AddApplicantStatusIdToDepartmentStatuses < ActiveRecord::Migration
  def self.up
    add_column :department_statuses, :applicant_status_id, :integer
  end

  def self.down
    remove_column :department_statuses, :applicant_status_id
  end
end
