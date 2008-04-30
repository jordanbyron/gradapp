class CreateHeaderTemplates < ActiveRecord::Migration
  def self.up
    create_table :header_templates do |t|
      t.integer :ppos_template_id
      t.string :header
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :header_templates
  end
end
