#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'

require 'jessewolgamott'
require 'test/unit'
require 'rack/test'

set :environment, :test

class HelloWorldTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_home_page_it_says_i_hate_complacency
    get '/'
    assert last_response.ok?
    assert last_response.body.include?('I cannot stand complacency')
  end
  
  def test_resume_page_shows
    get '/resume'
    assert last_response.ok?
    assert last_response.body.include?('My <em>Resume</em>')
  end

  def test_homepage_sets_home_navigation_active
  	route = "home"
  	current_path = "/"
  	assert_equal lib_nav_active(route, current_path),"<li><a href=\"/\" class=\"active\">home</a></li>"
   end
   
  def test_homepage_sets_campaigns_not_active
    route = "campaigns"
  	current_path = "/"
  	assert_equal lib_nav_active(route, current_path), "<li><a href=\"campaigns\">campaigns</a></li>"
  end
  
  def test_resume_page_sets_resume_active
    route = "resume"
  	current_path = "resume"
  	assert_equal lib_nav_active(route, current_path), "<li><a href=\"resume\" class=\"active\">resume</a></li>"
  end
end
  