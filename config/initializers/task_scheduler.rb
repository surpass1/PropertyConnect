scheduler = Rufus::Scheduler.new

scheduler.every('5h') do 
	exec("rake scrape:knight_frank --trace") 
end