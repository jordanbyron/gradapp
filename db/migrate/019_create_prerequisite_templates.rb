class CreatePrerequisiteTemplates < ActiveRecord::Migration
  def self.up
    create_table :prerequisite_templates do |t|
      t.integer :ppos_template_id
      t.string :prerequisite

      t.timestamps
    end
  end

  def self.down
    drop_table :prerequisite_templates
  end
end
