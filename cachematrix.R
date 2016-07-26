## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    ## This is the "setter". It creates the variables that will be accessed
    ## from outside of this function
    set <- function(y) {
        x <<- y
        i <<- NULL
    }
    ## The "getter" makes those variables accessable to outside operations
    get <- function() x
    setsolve <- function(solve) i <<- solve
    getsolve <- function() i
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
}


## Write a short comment describing this function
cacheSolve <- function(x, ...) {
        ## "Gets" the data/operations from the previous function 
	i <- x$getsolve()
        ## Checks to see if the inverse has already been cached
	if(!is.null(i)) {
            message("getting cached data")
            return(i)
        }
	## The actual inverting of the matrix happens here
        data <- x$get()
        i <- solve(data)
        x$setsolve(i)
        i
}

