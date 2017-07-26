module ApplicationHelper
	
	#Return the active word if the current page is the path passed via parameter
	def active?(path)
		"active" if current_page?(path)
	end

end
