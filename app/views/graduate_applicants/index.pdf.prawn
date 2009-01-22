current_date = Time.now.localtime.strftime("%m/%d/%Y")

pdf.font.size = 10
pdf.text "Graduate Applicants", :size => 24, :spacing => 4
pdf.text "#{current_user.department.name} Department", :size => 12, :spacing => 15

data = []

@graduate_applicants.each do |graduate_applicant|
  data += [[graduate_applicant.last_name_first, graduate_applicant.studentID, graduate_applicant.department_status.applicant_status.short_status,graduate_applicant.department_status.status]]
end

pdf.table data,
  :font_size          => 12,
  :position           => :left,
  :headers            => ["Name", "Student ID", "SGS Status", "Department Status"],
  :row_colors         => ["ffffff", "E8E8E8"],
  :vertical_padding   => 5,
  :horizontal_padding => 2
  
pdf.footer [pdf.margin_box.left, pdf.margin_box.bottom + 10] do
  pdf.font "Helvetica" do
    pdf.stroke_horizontal_rule
    pdf.text "Generated on #{current_date} by GradApp", :size => 10
  end
end