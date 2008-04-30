class CreateCourseTemplates < ActiveRecord::Migration
  def self.up
    create_table :course_templates do |t|
      t.integer :header_template_id
      t.string :short_dept_name
      t.integer :course_number
      t.string :course_name
      t.integer :credits
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :course_templates
  end
end
