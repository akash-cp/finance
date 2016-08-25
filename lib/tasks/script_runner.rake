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