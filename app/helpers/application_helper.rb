module ApplicationHelper
	
	def logo
   image_tag("logo_djbf.png", :alt => "DJ's Best Friend", :class => "round") 
  end
	
	# Return a title on a per-page basis.
  def title
    base_title = "DJ's Best Friend"
		if @title.nil?
			base_title
			else
			"#{base_title} | #{@title}"
		end
  end
end
