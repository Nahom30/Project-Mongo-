class AnalyzeTwitter

	def crunch_data
		#1. ask twitter return tweets related to the primary elections
		#2. Process each tweet for candidate information
		candidates = {
			"hillary" => 0,
			"bernie" => 0,
			"kasich" => 0,
			"ted" => 0,
			"trump" => 0
		}

		total_tweets = 0
		$twitter.search('#Election2016').each do |tweet|
			text = tweet.text
			Rails.logger.info process_text(text, candidates)
			total_tweets += 1
		end

		return candidates
	end

	def process_text(text, candidates)

		text.split(" ").each do |word|
			clean_up_word(word)
			if word.include?("trump") || word.include?("donald") || word.include?("@realdonaldtrump")
				candidates["trump"] += 1
			elsif word.include?("clinton") || word.include?("hillary") || word.include?("@hillaryclinton")
				candidates["hillary"] += 1
			elsif word.include?("bernie") || word.include?("sanders") || word.include?("@sensanders")
				candidates["bernie"] += 1
			elsif word.include?("cruz") || word.include?("ted") || word.include?("@tedcruz")
				candidates["ted"] += 1
			elsif word.include?("kasich") || word.include?("john") || word.include?("@johnkasich")
				candidates["kasich"] += 1
			end
		end

		return candidates
	end
	
	def clean_up_word(word)
		word.strip!
		word.chomp!(".")
		word.chomp!(",")
		word.chomp!("\"")	
		word.downcase!
	end

	def save(results)
		results.each do |name, mentions|
			candidate =  Candidate.find_or_create_by(name: name)
			candidate.update_attribute(:mentions, candidate.mentions.to_i + mentions)
		end		
	end
end