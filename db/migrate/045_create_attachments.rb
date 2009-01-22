class CreateAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.integer :graduate_applicant_id
      t.string :title
      t.text :description
      t.string :created_by

      t.timestamps
    end
  end

  def self.down
    drop_table :attachments
  end
end
