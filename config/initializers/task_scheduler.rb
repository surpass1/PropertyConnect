scheduler = Rufus::Scheduler.new

scheduler.every('1s') do 
	exec("rake scrape:knight_frank --trace") 
end