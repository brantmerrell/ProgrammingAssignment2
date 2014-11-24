## These functions 
## 


## makeCacheMatrix is a matrix object that can cache the result of cacheSolve.
makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){ ## nest promised function 
    x<<-y  ## assign nested "y" to variable "x" accessible from outside environment
    i<<-NULL
  }
  get<-function() x
  setmatrix<-function(solve) m <<- solve ## assign "setmatrix" as a function taking input from outside environment
  getmatrix<-function() m ## specify variable to search for outside environment
  list(set=set,get=get,setmatrix=setmatrix,getmatrix=getmatrix)  ## generate list (with name = function)
}


## cacheSolve returns the inverse of matrix X
cacheSolve <- function(x, ...) {
  m<-x$getmatrix()  ## set variable to result of function from other environment
  if(!is.null(m)){    ## test whether s is null, which depends on whether cache has been stored.
    message("cacheSolve object")    ## if s is not null, return message.
    return(m)    ## if s is not null, return stored cache.
  }
  matrix<-x$get()    ## otherwise, use nested function from other environment to generate data object
  mean<-solve(matrix,...)    ## invert the matrix
  x$setmatrix(m)    ## return inverted matrix
}
