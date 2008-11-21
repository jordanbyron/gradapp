class AddLicenseToDepartment < ActiveRecord::Migration
  def self.up
    add_column :departments, :license, :string
  end

  def self.down
    remove_column :departments, :license
  end
end
