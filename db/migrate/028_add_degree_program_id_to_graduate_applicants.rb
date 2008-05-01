class AddDegreeProgramIdToGraduateApplicants < ActiveRecord::Migration
  def self.up
    add_column :graduate_applicants, :degree_program_id, :integer
  end

  def self.down
    remove_column :graduate_applicants, :degree_program_id
  end
end
