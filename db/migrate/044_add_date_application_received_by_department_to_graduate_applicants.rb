class AddDateApplicationReceivedByDepartmentToGraduateApplicants < ActiveRecord::Migration
  def self.up
    add_column :graduate_applicants, :date_application_received_by_department, :datetime
  end

  def self.down
    remove_column :graduate_applicants, :date_application_received_by_department
  end
end
