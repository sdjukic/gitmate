Gem::Specification.new do |s|
	s.name        = 'gitmate'
	s.version     = '0.0.1'
	s.executables  = ['gitmate']
	s.date        = '2015-04-07'
	s.summary     = 'Interface with github via command line.'
	s.description = 'Gem that interfaces with github over command line. 
	                 Giving us github capabilities on cli.'
	s.authors     = ['Slavisa Djukic']
	s.email       = 'ssdjuka@gmail.com'
	s.files       = ['lib/gitmate.rb', 'lib/gitmate/repos.rb', 
		             'lib/gitmate/zen.rb']
	s.homepage    = 'https://github.com/sdjukic/gitmate'
	s.license     = 'MIT'
end