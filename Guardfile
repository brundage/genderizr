cli_opts = File.read(".rspec").split(/\n/).join(" ")
guard 'rspec', :cli => cli_opts do
  watch( %r{^spec/.+_spec\.rb$} )
  watch( %r{^spec/spec_helper\.rb$} ) { "spec" }
  watch( %r{^spec/shared/.+\.rb$} )   { "spec" }
  watch( %r{^lib/.+/(.+)\.rb$} )      { |m| "spec/#{m[1]}_spec.rb" }
  watch( %r{^lib/([^/]+)\.rb$} )      { "spec" }
end
