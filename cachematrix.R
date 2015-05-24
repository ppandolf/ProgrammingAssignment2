## The following two functions store a square 2x2 matrix, and compute and cache the inverse of the 
## matrix 
##################################################################
## Function makeCacheMatrix stores functions to
##  create a 2x2 numeric data matrix from a numeric input vector
##  retrieve the matrix
##  calculate the inverse matrix using the Solve function
##  retrieve the inverted matrix

makeCacheMatrix <- function(x = matrix()) {
	
	mtxinv <- NULL

##define base matrix
	newmtx <- function(y) {
                  mtx <<- matrix(y, nrow=2, ncol=2)
                  mtxi <<- NULL
        }

##retrieve base matrix
	getmtx <- function() {
                  mtx  
        }

##compute inverse of base matrix
        setmtxi <- function(mtx) { 
        	mtxi <<- solve(mtx)
	}

##retrieve inverted matrix
        getmtxi <- function()    { 
		mtxi
        }

##Store list of defined functions for invocation 
## by other functions such as cacheSolve
list(newmtx = newmtx, 
     getmtx = getmtx,
     setmtxi = setmtxi,
     getmtxi = getmtxi)
}

##################################################################   

## Function cacheSolve determines the inverse of a base matrix 
## returned by `makeCacheMatrix` above. If the base matrix has not 
## changed, the existing inverse matrix will be retrieved from the 
## cache; otherwise the inverse will be recalculated here. 


cacheSolve <- function(x, ...) {
           
           mtxi <- x$getmtxi()
            if(!is.null(mtxi)) {
                    message("getting cached data")
                    return(mtxi)
            }
            mtx <- x$getmtx()
            mtxi<-x$setmtxi(mtx)
}