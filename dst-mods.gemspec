
Gem::Specification.new do |s|
  s.name        = 'dst-mods'
  s.version     = '1.0.0.alpha.4'
  s.date        = '2015-07-19'
  s.summary     = "Extract data from Don't Starve Together mods"
  s.description = "Extract data from Don't Starve Together mods"
  s.authors     = ["Brian Lauber"]
  s.email       = 'constructible.truth@gmail.com'
  s.files       = Dir["lib/**/*.rb"]
  s.license     = "MIT"

  s.homepage    = "https://github.com/briandamaged/dst-mods"

  s.add_dependency 'recsym',   '~> 1.0'
  s.add_dependency 'ruby-lua', '~> 0.4'
end

