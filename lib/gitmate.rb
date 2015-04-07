class Gitmate

  def initialize
    @zen = Zen.new
    @repo = Repos.new
  end

  def zen
    puts @zen.message
  end

  def list_repos
  	repo_json = @repo.get_repos
  	puts "\e[34m Here are all your repositories:\e[0m"
    repo_json.each do |repo|
      puts "\e[35m #{repo["name"]} \e[0m "
      repo.each do |k, v|
        puts "#{k} #{v}"
      end
    end
  end
end

require 'gitmate/zen'
require 'gitmate/repos'