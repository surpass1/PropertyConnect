scheduler = Rufus::Scheduler.new

scheduler.every('1d') do 
	exec("rake scrape:knight_frank --trace") 
end