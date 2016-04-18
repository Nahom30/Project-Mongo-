# Flush out data if you need to refresh
# Run this in the rails console
# Candidate.collection.drop
class Candidate
	include Mongoid::Document

	field :name, type: String
	field :mentions, type: Integer
end