
module Github
  class GitApiCalls
    
    @root = "https://api.github.com/"
    def self.api_call(destination, options={}) 
      if options[:zen]
        `curl -s "#{@root}#{destination}"&`
      elsif options[:user]
        `curl -s -u "#{options[:user]}" "#{@root}#{destination}"&` # had to split arg to curl into two strings
      end
        
    end
  end
end