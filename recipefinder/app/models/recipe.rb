# class Recipe < ActiveRecord::Base
class Recipe
 include HTTParty
 key_value = ENV["FOOD2FORK_KEY"] || '7284cd575db080b72c63cd969516d4b9'

 hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
 base_uri "http://#{hostport}/api"
 default_params key: key_value
   
   
   format :json

	def self.for search
		get("/search", query: {q: search})["recipes"]
	end
end