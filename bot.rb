require 'rubygems'
require 'bundler/setup'
require 'dotenv/load'
require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["CONSUMER_KEY"]
  config.consumer_secret     = ENV["CONSUMER_SECRET"]
  config.access_token        = ENV["ACCESS_TOKEN"]
  config.access_token_secret = ENV["ACCESS_SECRET"]
end

numberOfTweets = 50
searchKeywords = ['@elementary', #elementaryOS']

client.search(searchKeywords.join(' OR '), lang: 'en').take(numberOfTweets).collect do |tweet|
  client.retweet tweet
  sleep(1)
end
