class CreateSupportRequests < ActiveRecord::Migration
  def self.up
    create_table :support_requests do |t|
      t.string :support_request_type
      t.string :summary
      t.text :explination
      t.string :created_by
      t.string :status
      t.datetime :closed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :support_requests
  end
end
