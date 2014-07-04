scheduler = Rufus::Scheduler.new

scheduler.every('1m') do 
	exec("rake scrape:knight_frank --trace") 
end