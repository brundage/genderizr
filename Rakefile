require 'erb'
GEMSPEC_FILENAME = "genderizr.gemspec"
GEMSPEC_BUILDER = "./util/build_gemspec"

unless File.exists? GEMSPEC_FILENAME
  fail "#{GEMSPEC_FILENAME} not found. Run #{GEMSPEC_BUILDER}"
end

GEMSPEC_ERB = GEMSPEC_FILENAME + ".erb"

def gemspec(file=GEMSPEC_FILENAME,reload=false)
  if ( ! @_gemspec || reload )
    @_gemspec = eval(File.read(file)) rescue nil
  else
    @_gemspec
  end
end

def gemspec!(file=GEMSPEC_FILENAME)
  gemspec(file,true)
end

gemname = "#{gemspec.full_name}.gem"

task :build => [:build_gemspec, gemname]
task :build_gemspec => GEMSPEC_ERB

file GEMSPEC_FILENAME => GEMSPEC_ERB do
  system GEMSPEC_BUILDER
  gemspec!
end

file gemname => gemspec.files + [GEMSPEC_FILENAME] do
  system "gem build #{GEMSPEC_FILENAME}"
  system "gem install #{gemname}"
end

