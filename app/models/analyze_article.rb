class AnalyzeArticle
	def start
		# Open the file db/article.txt
		# Read from the article line by line
		# For each line you read break it up into words
		# For each word check if it matches a candidates name.
		# If it matches a candidates name then you increment 
		#  the counter for the particular candidate.
		trump_counter = 0
		hillary_counter = 0
		bernie_counter = 0
		ted_counter = 0
		kasich_counter = 0



		File.open(Rails.root + "db/article.txt", "r").each_line do |line|
			line.split(" ").each do |word|
				clean_up_word(word)
				if word == "trump" || word == "donald"
					trump_counter += 1
				elsif word == "clinton" || word == "hillary"
					hillary_counter += 1
				elsif word == "bernie" || word == "sanders"
					bernie_counter += 1
				elsif word == "cruz" || word == "ted"
					ted_counter += 1
				elsif word == "kasich" 
					kasich_counter += 1

				end
			end
		end

		results = {
			"hillary" => hillary_counter,
			"bernie" => bernie_counter,
			"kasich" => kasich_counter,
			"ted" => ted_counter,
			"trump" => trump_counter
		}



		Rails.logger.info "Found this number of trumps: #{trump_counter}"
		Rails.logger.info "Found this number of hillary: #{hillary_counter}"
		Rails.logger.info "Found this number of bernie: #{bernie_counter}"
		Rails.logger.info "Found this number of ted: #{ted_counter}"
		Rails.logger.info "Found this number of kasich: #{kasich_counter}"

		Rails.logger.info results.inspect

		return results
	end

	# To remove any punctuations from a word
	def clean_up_word(word)
		word.strip!
		word.chomp!(".")
		word.chomp!(",")
		word.chomp!("\"")	
		word.downcase!
	end

	# this saves the data into mongo db
	def save(results)
		
	end
end


