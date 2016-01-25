## Put comments here that give an overall description of what your
## set a matrix and cache its iverse

## four operation in this object: set, get, set_inv, get_inv

makeCacheMatrix = function(x = matrix()) {
   inv = NULL
   set = function(y) {
       x <<- y
       inv <<- NULL
   }
   get = function() x
   set_inv = function(inv_val) inv <<- inv_val
   get_inv = function() inv
   list(set=set, get=get, set_inv=set_inv, get_inv=get_inv)
}

## check: if inverse exist, load it. otherwise, solve it. 

cacheSolve = function(x, ...) {
   inv_val = x$get_inv()
   if(!is.null(inv_val)) {
       message("getting cached data.")
       return(inv_val)
   }
   inv_val = solve(x$get())
   x$set_inv(inv_val)
   inv_val
}

# Examples:
#a=cbind(c(2,5),c(5,2))
#m=makeCacheMatrix(a)
#cacheSolve(m)
