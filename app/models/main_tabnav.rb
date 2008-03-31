class MainTabnav < Tabnav::Base    
       
    add_tab do 
      named 'Graduate Tracking'
      links_to :controller => 'home'
    end
	
	add_tab do 
      named 'Templates'
      links_to :controller => 'home'
    end
	
	add_tab do 
      named 'Departments'
      links_to :controller => 'home'
    end
         
end