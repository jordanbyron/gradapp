class CreateConsentrationsTemplates < ActiveRecord::Migration
  def self.up
    create_table :consentrations_templates do |t|
      t.integer :ppos_template_id
      t.integer :total

      t.timestamps
    end
  end

  def self.down
    drop_table :consentrations_templates
  end
end
