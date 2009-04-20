class AddSubjectToCorrespondenceTemplates < ActiveRecord::Migration
  def self.up
    add_column :correspondence_templates, :subject, :string
  end

  def self.down
    remove_column :correspondence_templates, :subject
  end
end
