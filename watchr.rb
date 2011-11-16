
# Run me with:
#
#   $ bundle exec watchr specs.watchr

# --------------------------------------------------
# Convenience Methods
# --------------------------------------------------
def all_spec_files
  Dir['spec/**/*_spec.rb']
end

def run_spec_matching(thing_to_match)
  matches = all_spec_files.grep(/#{thing_to_match}/i)
  if matches.empty?
    puts "Sorry, thanks for playing, but there were no matches for #{thing_to_match}"  
  else
    run matches.join(' ')
  end
end

def run(files_to_run)
  puts("Running: #{files_to_run}")
  system("clear;rspec -cfs #{files_to_run}")
end

def run_all_specs
  run(all_spec_files.join(' '))
end

# --------------------------------------------------
# Watchr Rules
# --------------------------------------------------
watch('^spec/(.*)_spec\.rb')   { |m| run_spec_matching(m[1]) }
watch('^lib/(.*)\.rb')         { |m| run_spec_matching(m[1]) }
watch('^spec/spec_helper\.rb') { run_all_specs }
watch('^spec/support/.*\.rb')   { run_all_specs }

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------

# Ctrl-\
Signal.trap('QUIT') do
  puts " --- Running all tests ---\n\n"
  run_all_specs
end

# Ctrl-C
Signal.trap('INT') do
  puts "\nExiting watchr."
  abort("\n")
end

# vim:ft=ruby
