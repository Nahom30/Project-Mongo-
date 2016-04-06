class Candidate
	include Mongoid::Document

	field :name, type: String
	field :mentions, type: Integer
end