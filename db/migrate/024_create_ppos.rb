class CreatePpos < ActiveRecord::Migration
  def self.up
    create_table :ppos do |t|
      t.integer :graduate_applicant_id
      t.string :created_by
      t.datetime :expires_on
      t.integer :concentration
      t.integer :total_concentrations
      t.integer :degree_program_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ppos
  end
end
