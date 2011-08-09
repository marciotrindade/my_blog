guard 'livereload' do
  watch(%r{app/.+\.(erb|slim)})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|sass|js|html)})
  watch(%r{config/locales/.+\.yml})
end

guard 'rspec', :cli => "--color --fail-fast --drb", :version => 2 do
  watch(%r{^spec/.+_spec\.rb})
  watch(%r{^lib/(.+)\.rb})     { |m| "spec/lib/#{m[1]}_spec.rb" }

  # Rails example
  watch('spec/spec_helper.rb')                       { "spec" }
  watch('config/routes.rb')                          { "spec/routing" }
  watch('app/controllers/application_controller.rb') { "spec/controllers" }
  watch('app/controllers/admin/base_controller.rb')  { "spec/controllers/admin" }
  watch(%r{^spec/.+_spec\.rb})
  watch(%r{^app/(.+)\.rb})                           { |m| "spec/#{m[1]}_spec.rb" }
  watch(%r{^lib/(.+)\.rb})                           { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch(%r{^app/controllers/(.+)_(controller)\.rb})  { |m| ["spec/routing", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/requests/#{m[1]}_spec.rb"] }
  watch(%r{^app/views/(.+)/})                        { |m| ["spec/controllers/#{m[1]}_spec.rb", "spec/requests/#{m[1]}_spec.rb"] }
end
