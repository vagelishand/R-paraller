create_cluster <- function(core_number_user){
   library(parallel)
   library(doParallel)
   print(paste("This system has:" , detectCores(all.tests = FALSE, logical = TRUE) ,"available cores"))
   core_number = detectCores(all.tests = FALSE, logical = TRUE)
   if (is.null(core_number_user)==T){
     cl <- makeCluster(core_number) 
     registerDoParallel(cl, cores=core_number)
	 #cl <- makePSOCKcluster(core_number)  	
     #registerDoSEQ(cl)
   }else{
     cl <- makeCluster(core_number_user) 
	 registerDoParallel(cl, cores=core_number_user)
     #cl <- makePSOCKcluster(core_number)  		
     #registerDoSEQ(cl)
   }
   print(paste("A cluster of ",getDoParWorkers() , " has been created.", sep=""))
   print(showConnections())
   return(cl)
 }
