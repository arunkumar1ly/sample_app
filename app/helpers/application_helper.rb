module ApplicationHelper	#modules give us a way to package together related methods, which can then be mixed in to Ruby classes using include.

  # Returns the full title on a per-page basis.			# Documentation comment
  def full_title(page_title)							# Method definition
    base_title = "Ruby on Rails Tutorial Sample App"	# variable assignment
    if page_title.empty?								# Boolean test
      base_title										# Implicit Return
    else
      "#{base_title} | #{page_title}"					# String interpolation
    end
  end

  #Note : The result is that the method in module ApplicationHelper is automagically available in all our views.
end