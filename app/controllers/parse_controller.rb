class ParseController < ApplicationController
	def index	
	end

	def show
		@results = AnalyzeArticle.new.start
		AnalyzeArticle.new.save(@results)
	end

end
