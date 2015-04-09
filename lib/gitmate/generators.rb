require 'thor/group'
require 'fileutils'
require_relative 'repos'

module Gitmate
  class CreateRepository < Thor::Group  
  	argument :repo_name, :type => :string, :desc => "Repository name"
  	desc "Creates directory and in it git repository locally and remotely on github."

  	def create_local
  	  FileUtils.mkdir(repo_name) unless File.directory?(repo_name)
  	  FileUtils.cd(repo_name)
  	  system "git init"
  	end

  	def create_remote
  	  puts "Now we will create remote."
      Repos.create_repo(repo_name)
  	end
  end
end