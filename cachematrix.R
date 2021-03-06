## The following functions are designed to calculate, cache, and return the 
## inverse of a square matrix. All matrices are initially calculated with 
## solve(x). Inverse matrices that have already been calculated are retuned 
## from the cache. 

## makecaheMatrix provides functions to:
## 1) set the value of the matrix
## 2) get the value of the matrix
## 3) set the value of the inverse
## 4) get the value of the inverse
makeCacheMatrix <- function(x = matrix()) {
        ## invt will be used to cache the inverse matrix 
        invt <- NULL
        ## Setter
        set <- function(y) {
                x <<- y
                invt <<- NULL
        }
        ## Getter
        get <- function() x
        ## Setter for inverse matrix
        setinverse <- function(inverse) invt <<- inverse
        ## Getter for the inverse matrix
        getinverse <- function() invt
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

## cacheSolve will calculate the inverse of a matrix with solve(x). If this 
## solution has already been calculated, the inverse matrix will be retuned 
## from cache.
cacheSolve <- function(x, ...) {
        invt <- x$getinverse()
        ## Return the inverse matrix, if it is already calculated
        if(!is.null(invt)) {
                message("Getting cached data for ya, buddy:")
                return(invt)
        }
        ## Calculate the inverse matrix, if the solution does not yet exist.
        data <- x$get()
        invt <- solve(data, ...)
        ## Cache the inverse matrix 
        x$setinverse(invt)
        invt
}

