module ApplicationHelper
	def admin_types
		['AdminUser']
	end

	def active?(path)
		"active" if current_page?(path)
	end

end
