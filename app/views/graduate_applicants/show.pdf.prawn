current_date = Time.now.localtime.strftime("%m/%d/%Y")

pdf.text "#{@graduate_applicant.full_name}", :size => 24, :spacing => 15

pdf.text "Contact Information", :size => 16, :spacing => 15, :style => :bold

pdf.text "#{@graduate_applicant.address1}" , :size => 12, :spacing => 2

if @graduate_applicant.address2.length > 0
  pdf.text "#{@graduate_applicant.address2}" , :size => 12, :spacing => 2
end

pdf.text "#{@graduate_applicant.city}, #{@graduate_applicant.state} #{@graduate_applicant.zip}" , :size => 12, :spacing => 2
pdf.text "#{@graduate_applicant.country}" , :size => 12, :spacing => 15

pdf.text "Day phone: #{@graduate_applicant.phone_day}" , :size => 12
pdf.text "Night phone: #{@graduate_applicant.phone_night}" , :size => 12
pdf.text "#{@graduate_applicant.email}" , :size => 12, :spacing => 15

pdf.text "Application Requirements", :size => 16, :spacing => 15, :style => :bold

@graduate_applicant.applicant_requirements.each do |applicant_requirement|
  pdf.text "#{applicant_requirement.requirement}", :size => 12, :spacing => 2
  #pdf.text " ", :spacing =>1
  #pdf.text "Sent On #{correspondence.sent_on} by  #{correspondence.created_by}", :size => 8, :spacing => 3
  #pdf.stroke_horizontal_rule
end

pdf.footer [pdf.margin_box.left, pdf.margin_box.bottom + 10] do
  pdf.font "Helvetica" do
    pdf.stroke_horizontal_rule
    pdf.text "Generated on #{current_date} by GradApp", :size => 10
  end
end

pdf.start_new_page()

pdf.text "#{@graduate_applicant.full_name}", :size => 24, :spacing => 15
pdf.text "Notes", :size => 16, :spacing => 15, :style => :bold

@graduate_applicant.notes.each do |note|
  pdf.text "#{note.text}", :size => 12, :spacing => 2
  pdf.move_down 10
  pdf.text "Created On #{note.created_date} by  #{note.created_by}", :size => 8, :spacing => 3
  pdf.stroke_horizontal_rule
  pdf.move_down 10
end

pdf.footer [pdf.margin_box.left, pdf.margin_box.bottom + 10] do
  pdf.font "Helvetica" do
    pdf.stroke_horizontal_rule
    pdf.text "Generated on #{current_date} by GradApp", :size => 10
  end
end

pdf.start_new_page()

pdf.text "#{@graduate_applicant.full_name}", :size => 24, :spacing => 15
pdf.text "Correspondence", :size => 16, :spacing => 15, :style => :bold

@graduate_applicant.correspondences.each do |correspondence|
  pdf.text "#{correspondence.text}", :size => 12, :spacing => 2
   pdf.move_down 10
  pdf.text "Sent On #{correspondence.sent_on} by  #{correspondence.created_by}", :size => 8, :spacing => 3
  pdf.stroke_horizontal_rule
end

pdf.footer [pdf.margin_box.left, pdf.margin_box.bottom + 10] do
  pdf.font "Helvetica" do
    pdf.stroke_horizontal_rule
    pdf.text "Generated on #{current_date} by GradApp", :size => 10
  end
end