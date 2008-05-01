class CreatePposPrerequisites < ActiveRecord::Migration
  def self.up
    create_table :ppos_prerequisites do |t|
      t.integer :ppos_id
      t.string :prerequisite
      t.boolean :met
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :ppos_prerequisites
  end
end
