## This is Programming Assignment 2
## It demonstrates the ability to cache data in accordance with
## R scoping rules

## This function creates a special "matrix" object that can cache 
## its inverse.

makeCacheMatrix <- function() {
  ## orig and inv hold the original and inverted matrix
      orig <- matrix()
      inv <- matrix()
  ## define the function to return the cached original matrix
      getorig <- function() orig
  ## define the function to return the cached inverted matrix
      getinv <- function() inv
  ## define the function to cache the original matrix
  ## orig is in the parent environment
      setorig <- function(x) orig <<- x
  ## define the function to cache the inverted matrix
  ## inv is in the parent environment
      setinv <- function(x) inv <<- x
  ## return a list to the functions we just defined
      list(getorig = getorig, getinv = getinv, setorig = setorig,
           setinv = setinv)
}



## computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), 
## then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, y,...) {
        ## Return a matrix that is the inverse of 'x'
        ## First get the current state of original and inverted
      myorig <- y$getorig()
      myinv <- y$getinv()

        ## if the original has changed, update everything
     if (!identical(x, myorig)) {
        y$setorig(x)
        ##print("solving")
        return(myinv <- y$setinv(solve(x)))
      }
        ## if the inverted exists use the cache
      if (!is.null(myinv)) {
        ##print("using cache")
        return(myinv)
      }
        ## otherwise solve and cache the inversion
      ##print("solving")
      return(myinv <- y$setinv(solve(x)))
}
