module Scrabble

LETTER_POINT_VALUES = { 1 => ["a", "e", "i", "o", "u", "l", "n", "r", "s", "t"],
												2 => ["d", "g"],
												3 => ["b", "c", "m", "p"],
												4 => ["f", "h", "v", "w", "y"],
												5 => ["k"],
												8 => ["j", "x"],
												10 => ["q", "z"]}

DEFAULT_TILES = ["A", "A", "A", "A", "A", "A", "A", "A", "A",
	"B", "B",
	"C", "C",
	"D", "D", "D", "D",
	"E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E",
	"F", "F",
	"G", "G", "G",
	"H", "H",
	"I", "I", "I", "I", "I", "I", "I", "I", "I",
	"J",
	"K",
	"L", "L", "L", "L",
	"M", "M",
	"N", "N", "N", "N", "N", "N",
	"O", "O", "O", "O", "O", "O", "O", "O",
	"P", "P",
	"Q",
	"R", "R", "R", "R", "R", "R",
	"S", "S", "S", "S",
	"T", "T", "T", "T", "T", "T",
	"U", "U", "U", "U",
	"V", "V",
	"W", "W",
	"X",
	"Y","Y",
	"Z"]

class Scrabble::Scoring #declare this as Scrabble::Scoring during cleanup.

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
	# iterate over the letters in the word (after downcasing the word to ensure it matches up
	# against our CONSTANT for checking)
	# figure out what word[index] is worth
	# add to running total
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

  # check if the word gets a bingo bonus
  if self.bonus?(word)
  	total_score += 50
  end

  return total_score
end

# this will check if the word gets a 7 letter bonus
def self.bonus?(word)
	if word.length >= 7
		return true
	end
end

end

end