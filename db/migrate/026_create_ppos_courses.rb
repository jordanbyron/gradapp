class CreatePposCourses < ActiveRecord::Migration
  def self.up
    create_table :ppos_courses do |t|
      t.integer :ppos_header_id
      t.string :short_dept_name
      t.integer :course_number
      t.string :course_name
      t.integer :credits
      t.integer :position
      t.boolean :taken

      t.timestamps
    end
  end

  def self.down
    drop_table :ppos_courses
  end
end
