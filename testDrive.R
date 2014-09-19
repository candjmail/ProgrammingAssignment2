## test driver for cacheSolve
## source cachematrix.R then run testDrive() in the console
##
testDrive <- function() {
  amatrix <- as.matrix(cbind(c(1 , 2), c(3, 4)))
  bmatrix <- as.matrix(cbind(c(10 , 20, 25), c(30, 40, 45),
                             c(50, 60, 70)))
  
  mylist <- makeCacheMatrix()
  
  print(amatrix)
  print("======")
  for (i in 1:3) print(inverteda <- cacheSolve(amatrix, mylist))
  print("=======")
  print(bmatrix)
  print("=======")
  for (i in 1:5) print(invertedb <- cacheSolve(bmatrix, mylist))
  
}