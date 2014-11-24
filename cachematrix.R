## These functions 
## 

## makeCacheMatrix is a matrix object that can cache the result of cacheSolve.


makeCacheMatrix <- function(x = matrix()) {
        m<-NULL
        set<-function(y){
          x<<-y
          i<<-NULL
        }
        get<-function() x
        setmatrix<-function(solve) m <<- solve
        getmatrix<-function() m 
        list(set=set,get=get,setmatrix=setmatrix,getmatrix=getmatrix)
}


## cacheSolve returns the inverse of matrix X

cacheSolve <- function(x, ...) {
  m<-x$getmatrix()
  if(!is.null(m)){
    message("cacheSolve object")
    return(m)
  }
  matrix<-x$get()
  mean<-solve(matrix,...)
  x$setmatrix(m)
}
