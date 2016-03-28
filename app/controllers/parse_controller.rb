class ParseController < ApplicationController
	def index
		AnalyzeArticle.new.start
	end
end
