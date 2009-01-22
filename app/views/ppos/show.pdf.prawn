pdf.font "Times-Roman"
scsu_seal = "/Users/byron/Code/GradApp/public/images/scsu.jpg"

pdf.image scsu_seal, :scale => 0.8, :at => [0,550]
#pdf.text "Hello Landscape World"


pdf.text "Southern Connecticut State University", :align => :center, :size => 20, :spacing => 2
pdf.text "Banner I.D.:", :style => :bold, :size => 11, :at => [580,509]
pdf.text "#{@ppos.graduate_applicant.studentID}", :size => 11, :at => [642,509]
pdf.text "Planned Program of Graduate Study", :align => :center, :size => 14, :spacing => 40


pdf.text "Coming Soon ...", :align => :center, :size => 36