## This is Programming Assignment 2
## It demonstrates the ability to cache data in accordance with
## R scoping rules

## This function creates a special "matrix" object that can cache 
## its inverse.

makeCacheMatrix <- function() {
  ## orig and inv represent the original and inverted matrix
      orig <- matrix()
      inv <- matrix()
      getorig <- function() orig
      getinv <- function() inv
      setorig <- function(x) orig <<- x
      setinv <- function(x) inv <<- x
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
