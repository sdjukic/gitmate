require 'thor'
require 'gitmate/zen'
require 'gitmate/repos'
require 'yaml'

$repo_data = YAML.load_file('conf.yml') 

class Gitmate < Thor 

  @@zen = Zen.new
  @@repo = Repos.new
  @@repo_cache = @@repo.get_repos

  desc "zen", "Displays random quote from github."
  method_option :desc => "A quote from github to inspire you."
  def zen
    puts "\e[30m #{@@zen.message} \e[0m"
  end

  desc "repos [repository]", "Different actions on your gitrepositories."
  method_option :list, :aliases => '-l', desc: 'List all repositories'
  method_option :details, :aliases => '-d', desc: 'Detailed information on a depo'
  def repos(the_repo=nil)
  
    if options[:list]
  	  puts "\e[34m Here are all your repositories:\e[0m"
      @@repo_cache.each do |repo|
        puts "\e[35m #{repo["name"]} \e[0m "
      end
    end
        
    if options[:details]
      unless the_repo
        puts "\e[31m ERROR: missing repository name.\n
              gitmate repos <repository_name> --details \e[0m "
      else
        repo = @@repo_cache.find{ |r| r["name"] == the_repo}
        if repo
          puts "\e[34m #{repo["name"]} \e[0m "
          $repo_data["InterestingKeys"].each do |p|
            puts "\e[32m #{p} #{repo[p]} \e[0m"
          end
        else
          puts "\e[31m No such repository. \e[0m"
        end
      end
    end
  end
end

