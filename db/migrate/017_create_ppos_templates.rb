class CreatePposTemplates < ActiveRecord::Migration
  def self.up
    create_table :ppos_templates do |t|
      t.integer :degree_program_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ppos_templates
  end
end
