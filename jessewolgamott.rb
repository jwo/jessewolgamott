#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'navigation_lib.rb'

not_found do
 #figure out how to raise 404 error
end

get '/' do
 erb :index
end

#rather than have 8 different methods like:
#=====
#get '/resume' do
#  erb :resume
#end
#=====
#I created a method to load if page found

get '/:call' do
  begin
  erb params[:call].to_sym
  
  #if the file does not exist
  rescue Errno::ENOENT => e
   pass
  end
end


helpers do
  def nav_active(route, current_path)
    lib_nav_active(route, current_path)
   end
end