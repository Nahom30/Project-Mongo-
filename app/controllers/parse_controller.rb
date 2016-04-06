class ParseController < ApplicationController
	def index	
	end

	def show
		results = AnalyzeArticle.new.start
		AnalyzeArticle.new.save(results)


		#grab the information from mongodb and send that to the view
		@results = Candidate.all
	end

end
