class CreateGraduateApplicants < ActiveRecord::Migration
  def self.up
    create_table :graduate_applicants do |t|
      t.integer :department_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone_day
      t.string :phone_night
      t.string :email
      t.string :status
      t.decimal :gpa
      t.string :studentID

      t.timestamps
    end
  end

  def self.down
    drop_table :graduate_applicants
  end
end
