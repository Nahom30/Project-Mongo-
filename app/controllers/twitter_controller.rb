class TwitterController < ApplicationController


	def index	
	end

	def show
		results = AnalyzeTwitter.new.crunch_data
		AnalyzeTwitter.new.save(results)


		#grab the information from mongodb and send that to the view
		@results = Candidate.all
	end

	
end