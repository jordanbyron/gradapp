class CreateApplicationRequirements < ActiveRecord::Migration
  def self.up
    create_table :application_requirements do |t|
      t.string :text
      t.string :department

      t.timestamps
    end
  end

  def self.down
    drop_table :application_requirements
  end
end
