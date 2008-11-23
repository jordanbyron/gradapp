class AddDepartmentIdToDepartmentStatus < ActiveRecord::Migration
  def self.up
    add_column :department_statuses, :department_id, :integer
  end

  def self.down
    remove_column :department_statuses, :department_id
  end
end
