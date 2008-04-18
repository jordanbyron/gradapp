class CreateDegreePrograms < ActiveRecord::Migration
  def self.up
    create_table :degree_programs do |t|
      t.integer :department_id
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :degree_programs
  end
end
