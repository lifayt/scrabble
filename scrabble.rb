require 'sinatra'
require_relative 'word.rb'

WORD = Word.new("data/")

get '/' do
	erb :index, :locals => {"word" => WORD, "rack" => nil}
end

post '/search/' do
	rack = params["rack"]
	rack.downcase!
	WORD.validate(rack)
	WORD.anagrams(rack)
	WORD.subwords(rack)
	erb :search, :locals => {"word" => WORD, "rack" => rack}
end

get '/search/' do
	erb :search, :locals => {"word" => WORD, "rack" => nil}
end