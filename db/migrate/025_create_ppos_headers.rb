class CreatePposHeaders < ActiveRecord::Migration
  def self.up
    create_table :ppos_headers do |t|
      t.integer :ppos_id
      t.string :header
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :ppos_headers
  end
end
