module Scrabble

LETTER_POINT_VALUES = { 1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
												2 => ["d", "g"],
												3 => ["b", "c", "m", "p"],
												4 => ["f", "h", "v", "w", "y"],
												5 => ["k"],
												8 => ["j", "x"],
												10 => ["q", "z"]}

	class Scrabble::Scoring

		def self.score(word)
			self.scoring_math(word)
		end

		def self.highest_score_from(array_of_words)
			highest_score = ""
			array_of_words.each do |word|
			  if self.score(word) > self.score(highest_score)
			    highest_score = word
			  elsif self.score(word) == self.score(highest_score)
			  	highest_score = word if word.length < highest_score.length
			  end
		  end
			return highest_score
		end

		private

		def self.scoring_math(word)
			total_score = 0

		  word = word.downcase

		  for index in 0..word.length - 1
				if Scrabble::LETTER_POINT_VALUES[1].include? word[index]
					total_score += 1
				elsif Scrabble::LETTER_POINT_VALUES[2].include? word[index]
					total_score += 2
				elsif Scrabble::LETTER_POINT_VALUES[3].include? word[index]
					total_score += 3
				elsif Scrabble::LETTER_POINT_VALUES[4].include? word[index]
					total_score += 4
				elsif Scrabble::LETTER_POINT_VALUES[5].include? word[index]
					total_score += 5
				elsif Scrabble::LETTER_POINT_VALUES[8].include? word[index]
					total_score += 8
				elsif Scrabble::LETTER_POINT_VALUES[10].include? word[index]
					total_score += 10
				end
		  end

		  if self.bonus?(word)
		  	total_score += 50
		  end

		  return total_score
		end

		def self.bonus?(word)
			if word.length >= 7
				return true
			end
		end
		
	end
end
