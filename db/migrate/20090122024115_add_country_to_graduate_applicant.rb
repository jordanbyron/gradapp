class AddCountryToGraduateApplicant < ActiveRecord::Migration
  def self.up
    add_column :graduate_applicants, :country, :string
  end

  def self.down
    remove_column :graduate_applicants, :country
  end
end
