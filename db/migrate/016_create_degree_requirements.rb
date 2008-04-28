class CreateDegreeRequirements < ActiveRecord::Migration
  def self.up
    create_table :degree_requirements do |t|
      t.integer :degree_program_id
      t.string :description

      t.timestamps
    end
  end

  def self.down
    drop_table :degree_requirements
  end
end
