class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.string :note_text
      t.datetime :note_datetime
      t.integer :graduate_applicant_id

      t.timestamps
    end
  end

  def self.down
    drop_table :notes
  end
end
