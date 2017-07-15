#created by Joe Seethaler
def Team_availability(arr)
	$times = ['8:30','9:00','9:30','10:00','10:30','11:00','11:30','12:00','12:30','1:00','1:30','2:00','2:30','3:00','3:30','4:00','4:30','5:00' ]	
	$resulttimes = $times.clone

	if arr.kind_of?(Array)
		result = []
		arr.each {|arrvalue|
			Delstarttimes(arrvalue)
		}
		# if a time still exists in the resulttimes then it is available for the next 30 min
		$resulttimes.each{|restimevalue|
			i = $resulttimes.index(restimevalue) # get result index of start time
			j = $times.index(restimevalue)+1 # get index of end time 
			result.push([$resulttimes[i],$times[j]]) #create array of array elements with start and end time		
		}

	else
		result = []
	end
		return result
end

def Delstarttimes(timerange)
	startvalue = $times.index(timerange[0])
	endvalue = $times.index(timerange[1])
	$resulttimes.delete('5:00')  # remove end of day from available start times
	$resulttimes.delete('12:00') # remove lunch from available start times
	$resulttimes.delete('12:30') # remove lunch from available start times
	if startvalue and endvalue 
		while startvalue < endvalue do # if current starttime position has not reached the endtime position then we continue
			#remove the busy start time from the resulttimes array
			$resulttimes.delete($times[startvalue])
			startvalue +=1  # increment the busy start time to the next time period 
		end
	end			
	#if startvalue and endvalue
end

p Team_availability([['9:00','9:30'],['10:00','1:30'],["5hs",'--9']])
p Team_availability(["count",[]])
p Team_availability("yuumm")
