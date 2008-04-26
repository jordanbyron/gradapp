class RenameColumnStatusIdToApplicantStatusIdOnGraduateApplicants < ActiveRecord::Migration
  def self.up
    rename_column "graduate_applicants", "status_id", "applicant_status_id"
  end

  def self.down
    rename_column "graduate_applicants", "applicant_status_id", "status_id"
  end
end
