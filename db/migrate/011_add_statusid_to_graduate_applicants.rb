class AddStatusidToGraduateApplicants < ActiveRecord::Migration
  def self.up
    add_column :graduate_applicants, :status_id, :integer
  end

  def self.down
    remove_column :graduate_applicants, :status_id
  end
end
