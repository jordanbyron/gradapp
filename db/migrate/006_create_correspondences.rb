class CreateCorrespondences < ActiveRecord::Migration
  def self.up
    create_table :correspondences do |t|
      t.datetime :sent_date_time
      t.integer :graduate_applicant_id
      t.string :text
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :correspondences
  end
end
