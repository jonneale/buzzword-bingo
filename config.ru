require 'rubygems'
require 'bundler/setup'
require 'heroku'
require 'sinatra'
require 'haml'
require File.join(File.dirname(__FILE__), *%w[lib server])
run BuzzwordBingo.new