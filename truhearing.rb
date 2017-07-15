#created by Joe Seethaler
$times = ['8:30','9:00','9:30','10:00','10:30','11:00','11:30','12:00','12:30','1:00','1:30','2:00','2:30','3:00','3:30','4:00','4:30','5:00' ]
$resulttimes = $times.clone
def Team_availability(arr)
#debug	p arr
#debug	p $times
	result = []
	arr.each {|arrvalue|
		Delstarttimes(arrvalue)
#debug p " after gettimes "	
#debug p $resulttimes
	}
	# if a time still exists in the resulttimes then it is available for the next 30 min
	$resulttimes.each{|restimevalue|
		i = $resulttimes.index(restimevalue) # get result index of start time
		j = $times.index(restimevalue)+1 # get index of end time 
		result.push([$resulttimes[i],$times[j]]) #create array of array elements with start and end time		
	}

#debug	p result
	return result
end

def Delstarttimes(timerange)
	startvalue = $times.index(timerange[0])
	endvalue = $times.index(timerange[1])
	while startvalue < endvalue do # if current starttime position has not reached the endtime position then we continue
		#remove the busy start time from the resulttimes array
		$resulttimes.delete($times[startvalue])
		startvalue +=1  # increment the busy start time to the next time period 
	end			

end

#debug Team_availability([['9:00','9:30'],['10:00','1:30']])
