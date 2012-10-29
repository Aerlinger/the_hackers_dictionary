# A sample Guardfile
# More info at https://github.com/guard/guard#readme

interactor :simple

guard 'spork', :cucumber_env => { 'RAILS_ENV' => 'test' }, :rspec_env => { 'RAILS_ENV' => 'test' } do
  watch('config/application.rb')
  watch('config/environment.rb')
  watch('config/environments/test.rb')
  watch(%r{^config/initializers/.+\.rb$})
  watch('Gemfile')
  watch('Gemfile.lock')
  watch('spec/spec_helper.rb') { :rspec }
  watch('test/test_helper.rb') { :test_unit }
  watch(%r{features/support/}) { :cucumber }
end

# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'livereload' do
  watch(%r{app/helpers/.+\.rb})
  watch(%r{app/views/.+\.(erb|haml)})
  watch(%r{(public/).+\.(css|js|html)})
  watch(%r{app/assets/stylesheets/(.+\.css).*$})    { |m| "assets/#{m[1]}" }
  watch(%r{app/assets/javascripts/(.+\.js).*$}) { |m| "assets/#{m[1]}" }
  watch(%r{lib/assets/stylesheets/(.+\.css).*$})    { |m| "assets/#{m[1]}" }
  watch(%r{lib/assets/javascripts/(.+\.js).*$}) { |m| "assets/#{m[1]}" }
  watch(%r{vendor/assets/stylesheets/(.+\.css).*$}) { |m| "assets/#{m[1]}" }
  watch(%r{vendor/assets/javascripts/(.+\.js).*$})  { |m| "assets/#{m[1]}" }
  watch(%r{config/locales/.+\.yml})
end

#guard 'spork', :cucumber_env => { 'RAILS_ENV' => 'test' }, :rspec_env => { 'RAILS_ENV' => 'test' } do
#  watch('config/application.rb')
#  watch('config/environment.rb')
#  watch(%r{^config/environments/.+\.rb$})
#  watch(%r{^config/initializers/.+\.rb$})
#  watch('Gemfile')
#  watch('Gemfile.lock')
#  watch('spec/spec_helper.rb')
#  watch('test/test_helper.rb')
#end

guard 'rspec', :version => 2, :cli => "--drb", :all_on_start => false, :all_after_pass => false do
  # ...
end

guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
  watch('config/routes.rb')                           { "spec/routing" }
  watch('app/controllers/application_controller.rb')  { "spec/controllers" }

  # Capybara request specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }

  # Turnip features and steps
  watch(%r{^spec/acceptance/(.+)\.feature$})
  watch(%r{^spec/acceptance/steps/(.+)_steps\.rb$})   { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'spec/acceptance' }
end

