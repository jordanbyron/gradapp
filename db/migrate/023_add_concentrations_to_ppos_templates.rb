class AddConcentrationsToPposTemplates < ActiveRecord::Migration
  def self.up
    add_column :ppos_templates, :concentrations, :integer
  end

  def self.down
    remove_column :ppos_templates, :concentrations
  end
end
