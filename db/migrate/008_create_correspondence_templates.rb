class CreateCorrespondenceTemplates < ActiveRecord::Migration
  def self.up
    create_table :correspondence_templates do |t|
      t.integer :department_id
      t.string :title
      t.string :body

      t.timestamps
    end
  end

  def self.down
    drop_table :correspondence_templates
  end
end
