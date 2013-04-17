arr = [1,2,3,4]
x = 0


while x < 20 do
	while true == true do
		random = rand(4)
		if random == 0
			puts "Random = " + arr[random].to_s
			break
		else
			toss = rand(2)
			if toss == 1
				puts "Random made it through the toss and it's:" + arr[random].to_s
				break
			else
				puts "Trying again"
				redo
			end
		end
	end
	x += 1 
end