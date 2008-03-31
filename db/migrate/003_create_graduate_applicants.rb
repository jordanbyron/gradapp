class CreateGraduateApplicants < ActiveRecord::Migration
  def self.up
    create_table :graduate_applicants do |t|
      t.string :first_name
      t.string :last_name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email
      t.string :status
      t.integer :department
      t.decimal :gpa
      t.string :studentID

      t.timestamps
    end
  end

  def self.down
    drop_table :graduate_applicants
  end
end
