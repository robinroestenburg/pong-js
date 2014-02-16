require 'bundler'
Bundler.require

desc "Build our app to build.js"
task :build do
  env = Opal::Environment.new
  env.append_path 'app'
  env.append_path 'vendor'

  File.open('js/build.js', 'w+') do |out|
    out << env['application'].to_s
  end
end
