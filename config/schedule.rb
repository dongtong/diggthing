set :environment, :development
set :output, "#{path}/log/cron.log"
#job_type :script "'#{path}/script/:task' :output"

#Time must be in minutes or higher (ArgumentError)
every 1.minute do
	#command "rm '#{path}/tmp/cache/foo.txt'"
	#script "generate_report"
	# File.open("#{path}/tmp/foo.txt", "a") do |f|
	# 	f.puts "Hello....."
	# end
	runner "Cartoon.scrap_sexiaozu"
end

# every :sunday, at: "4:28 AM" do
# 	#runner "Cart.clear_abandoned"
# end

# every :reboot do
# 	#rake "ts:start"
# end

# every :day, :at => '12:20am', :roles => [:app] do
#   rake "app_server:task"
# end

