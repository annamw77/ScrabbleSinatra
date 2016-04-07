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
    erb :score_many
  end

 #  post '/my-first-form' do
 #    @my_peep = Peep.new(params["peep"])
 #    erb :my_first_form
 # end

  run!
end
