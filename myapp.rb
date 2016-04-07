require 'sinatra'
require_relative 'lib/scoring'

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/score' do
    erb :score
  end

  post '/score' do
    @points = Scrabble::Scoring.score(params["word_to_score"])
    erb :score
  end

  get '/score_many' do
    erb :score_many
  end

  post '/score_many' do
    @num = params["num"].to_i
    @words = params["words"]
      if @words != nil
        @score_array = @words.map do |word|
          Scrabble::Scoring.score(word)
        end
      end
    erb :score_many
  end

  run!
end
