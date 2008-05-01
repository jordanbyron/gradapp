# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 23) do

  create_table "applicant_requirements", :force => true do |t|
    t.integer  "application_requirement_id"
    t.integer  "graduate_applicant_id"
    t.boolean  "met"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "applicant_statuses", :force => true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_status"
  end

  create_table "application_requirements", :force => true do |t|
    t.integer  "department_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consentrations_templates", :force => true do |t|
    t.integer  "ppos_template_id"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "correspondence_templates", :force => true do |t|
    t.integer  "department_id"
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "correspondences", :force => true do |t|
    t.datetime "sent_date_time"
    t.integer  "graduate_applicant_id"
    t.string   "text"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "course_templates", :force => true do |t|
    t.integer  "header_template_id"
    t.string   "short_dept_name"
    t.integer  "course_number"
    t.string   "course_name"
    t.integer  "credits"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "degree_programs", :force => true do |t|
    t.integer  "department_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "degree_requirements", :force => true do |t|
    t.integer  "degree_program_id"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.string   "short_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "graduate_applicants", :force => true do |t|
    t.integer  "department_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "suffix"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_day"
    t.string   "phone_night"
    t.string   "email"
    t.decimal  "gpa"
    t.string   "studentID"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "applicant_status_id"
  end

  create_table "header_templates", :force => true do |t|
    t.integer  "ppos_template_id"
    t.string   "header"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.integer  "graduate_applicant_id"
    t.text     "text"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "created_by"
  end

  create_table "ppos_templates", :force => true do |t|
    t.integer  "degree_program_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "concentrations"
  end

  create_table "prerequisite_templates", :force => true do |t|
    t.integer  "ppos_template_id"
    t.string   "prerequisite"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.boolean  "admin"
    t.boolean  "graduate_coordinator"
    t.integer  "department_id"
  end

end
