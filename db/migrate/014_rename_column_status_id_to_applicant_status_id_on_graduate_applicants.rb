class RenameColumnStatusIdToApplicantStatusIdOnGraduateApplicants < ActiveRecord::Migration
  def self.up
    rename_column "graduate_applicants", "status_id", "department_status_id"
  end

  def self.down
    rename_column "graduate_applicants", "department_status_id", "status_id"
  end
end
