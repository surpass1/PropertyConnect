scheduler = Rufus::Scheduler.new

scheduler.every('1h') do 
	exec("rake scrape:knight_frank --trace") 
end