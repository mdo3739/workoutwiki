module WikisHelper
	def markdown(words)
		renderer = Redcarpet::Render::HTML.new
		redcarpet = Redcarpet::Markdown.new(renderer, extensions = {})
		(redcarpet.render words).html_safe
	end
end
