desc "Runs an external ruby script"
task :run_ruby => :environment do
    filepath = Rails.root.join('lib', 'external_scripts', 'ruby_script.rb')
	output = `ruby #{filepath}`
	puts output
end

task :hello_world_r => :environment do
    puts "running R!"
    filepath = Rails.root.join("lib", "external_scripts", "hello_world.R")
    output = `Rscript --vanilla #{filepath} 'Akash Gupta'`
	puts output
end

task :run_r => :environment do
  puts 'running R!'

  filepath = Rails.root.join('lib', 'external_scripts', 'string_detection.R')

  greetings = [
    'ARRRGH ME MATEYS',
    'Why hello, old chap!',
    'Hollaaaa!',
    'Hello, is it me you\'re looking for?',
    'Avast! Ye ARRRE so smart.',
    'Shiver me timbers this is a gRRReat tutorial!'
  ]

  output = `Rscript --vanilla #{filepath} #{greetings}`
  puts "Here's the output:\n #{output}"
end