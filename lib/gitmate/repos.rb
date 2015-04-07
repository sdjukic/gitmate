
require 'yaml'
require 'net/http'
require 'uri'
require 'json'

user_data = YAML.load_file('.secret_config.yaml')
puts user_data["user"]


repos_uri = URI("https://api.github.com/users/#{user_data["user"]}/repos")


req = Net::HTTP::Get.new(repos_uri)
req.basic_auth("#{user_data["user"]}", "#{user_data["password"]}")
response = Net::HTTP.get_response(repos_uri)

resp_json = JSON.parse(response.body)

puts "\e[34m Here are all your repositories:\e[0m"
resp_json.each do |repo|
  puts "\e[35m #{repo["name"]} \e[0m "
  repo.each do |k, v|
    puts "#{k} #{v}"
  end
end