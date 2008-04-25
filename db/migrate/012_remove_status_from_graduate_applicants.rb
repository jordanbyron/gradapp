class RemoveStatusFromGraduateApplicants < ActiveRecord::Migration
  def self.up
    remove_column :graduate_applicants, :status
  end

  def self.down
    add_column :graduate_applicants, :status, :string
  end
end
