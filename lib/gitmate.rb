require 'thor'
require 'gitmate/zen'
require 'gitmate/repos'
require 'yaml'

$repo_data = YAML.load_file('conf.yml') 

class Gitmate < Thor 

  @@zen = Zen.new
  @@repo = Repos.new

  desc "zen", "Displays random quote from github."
  method_option :desc => "A quote from github to inspire you."
  def zen
    puts "\e[30m #{@@zen.message} \e[0m"
  end

  desc "list_repos", "Displays all repositories of the user"
  method_option :desc => "Prints all your repositories"
  def list_repos
  	repo_json = @@repo.get_repos
  	puts "\e[34m Here are all your repositories:\e[0m"
    repo_json.each do |repo|
      puts "\e[35m #{repo["name"]} \e[0m "
      $repo_data["InterestingKeys"].each do |p|
        puts "\e[32m #{p} #{repo[p]} \e[0m"
      
      end
    end
  end
end

