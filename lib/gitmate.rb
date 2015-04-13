require 'thor'
require 'gitmate/repos'
require 'gitmate/generators'
require 'json'

module Gitmate

  class CLI < Thor

    desc "zen", "Inspirational quote from github."
    method_option desc: "A quote from github to inspire you."
    def zen
      resp = Github::GitApiCalls.api_call("zen", {zen: true})
      puts "\e[30m #{resp} \e[0m"
    end

    desc "user", "General information about the user."
    method_option :name, aliases: '-n', desc: "User name"
    def user_details
    	resp = Github::GitApiCalls.api_call("user", {user: options[:name]})
    	puts resp
    end

   desc "repos [repository]", "Different actions on your gitrepositories."
   method_option :list, aliases: '-l', desc: 'List all repositories'
   method_option :details, aliases: '-d', desc: 'Detailed information on a depo'
   def repos(user_name, the_repo=nil)
    
     if options[:list]
      resp =  Github::GitApiCalls.api_call("user/repos", {user: user_name})
      puts "\e[34m Here are all your repositories:\e[0m"
     
      a = JSON.parse(resp)
      a.each do |line|
        puts "\e[32m #{p} #{line["name"]} \e[0m"
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
           puts "\e[31m ERROR: No such repository. \e[0m"
         end
       end
     end
   end 

    register(Gitmate::CreateRepository, "create", "counter", 
             "Creates git repo in local directory")
  end
end
#    
#  end

#  
    
#  desc "create", "Create local directory and repository in it and link it to github."
#  method_option :create, aliases: '-c'
#  def create(repo_name)
#    Gitmate::CreateRepository create repo_name
#  end

#end