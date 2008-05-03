class PposCourse < ActiveRecord::Base
  belongs_to :ppos_header

  def header_position=(header_position)

  end

end
