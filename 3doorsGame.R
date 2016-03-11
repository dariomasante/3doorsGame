## The host has already disclosed an empty door, now the guest 
## has to decide whether to swap or not
choice <- function(swap){
  wins <- vector()
  for(i in 1:10000){
  	winDoor <- sample(1:3,1)
  	doors <- rep('sorry...',3)
  	doors[winDoor] <- 'PRIZE!'
  
  	playerDoor <- sample(1:3,1)
  	if(playerDoor == winDoor){
  		hostDisclosedDoor <- sample(c(1:3)[-winDoor],1)
  	} else {
  		hostDisclosedDoor <- c(1:3)[-c(playerDoor,winDoor)]
  	}
  
  	if(swap == 'yes'){ playerDoor <- c(1:3)[-c(playerDoor,hostDisclosedDoor)]}
  	if(swap == 'no'){playerDoor <- playerDoor}		
  
  	if(doors[playerDoor] == 'PRIZE!'){wins <- c(wins, 1)} else {wins <- c(wins, 0)}
  }
  writeLines('Probability of prize (%):')
  print(sum(wins/10000)*100)
}

choice(swap = 'yes')
choice(swap = 'no')
