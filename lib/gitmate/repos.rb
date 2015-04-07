
require 'yaml'
require 'net/http'
require 'uri'
require 'json'

class Repos
  
  @@user_data = YAML.load_file('.secret_config.yaml')
  @@repos_uri = URI("https://api.github.com/users/#{@@user_data["user"]}/repos")

  def get_repos
    req = Net::HTTP::Get.new(@@repos_uri)
    req.basic_auth("#{@@user_data["user"]}", "#{@@user_data["password"]}")
    response = Net::HTTP.get_response(@@repos_uri)
    resp_json = JSON.parse(response.body)
  end

end