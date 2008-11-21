class CreateDepartmentStatuses < ActiveRecord::Migration
  def self.up
    create_table :department_statuses do |t|
      t.text :status
      
      t.timestamps
    end
  end

  def self.down
    drop_table :department_statuses
  end
end
