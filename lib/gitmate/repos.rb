
require 'yaml'
require 'net/http'
require 'uri'
require 'json'

class Repos
  
  @@user_data = YAML.load_file('.secret_config.yaml')
  @@repos_uri = URI("https://api.github.com/users/#{@@user_data["user"]}/repos")

  def self.get_repos
    req = Net::HTTP::Get.new(@@repos_uri)
    req.basic_auth("#{@@user_data["user"]}", "#{@@user_data["password"]}")
    response = Net::HTTP.get_response(@@repos_uri)
    resp_json = JSON.parse(response.body)
  end

  def self.create_repo(repo_name)
  	# will use curl which works and don't have to store user credentials
    repo_uri = URI("https://api.github.com/user/repos")
    req = Net::HTTP::Post.new(repo_uri)
    form_data = { "name" => "#{repo_name}"}.to_json
    req.set_form_data({'name' => repo_name})
    req.basic_auth("#{@@user_data["user"]}", "#{@@user_data["password"]}")

    #res = Net::HTTP.post_form(repo_uri, 'name' => repo_name) # this is good form, now find way to authenticate
    #req.set_form_data({data: form_data})
    res = Net::HTTP.start(repo_uri.hostname, repo_uri.port){ |http| http.request(req) }
    puts res.body
  end
end