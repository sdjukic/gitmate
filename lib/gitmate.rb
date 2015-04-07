class Gitmate

  def initialize
    @zen = Zen.new
  end

  def zen
    puts @zen.message
  end
end

require 'gitmate/zen'
