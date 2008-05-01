class PposHeader < ActiveRecord::Base
  belongs_to :ppos
  has_many :ppos_courses
end
