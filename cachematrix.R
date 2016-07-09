# Caching matrix functions.
#
# makeCacheMatrix and cacheSolve construct a wrapper object for a
# square matrix that caches the results of any call to solve(...).
#
# Example usage:
#
# hilbert <- function(n) { i <- 1:n; 1 / outer(i - 1, i, "+") }
# h8 = makeCacheMatrix(hilbert(8))
# cacheSolve(h8)

#` makeCacheMatrix(x = matrix())
#`
#` @param x A square matrix
#`
#` @return makeCacheMatrix returns a function list that computes
#` and caches the result of solve() on the given matrix. The returned
#` list has the following named elements:
#`
#`  get()               - Returns the original matrix
#`  set(x = matrix())   - Replaces the matrix
#`  solve()             - Returns the result of solve()ing the matrix
makeCacheMatrix <- function(x = matrix()) {

    # Cached solve() result.
    s <- NULL

    # Cached arguments to solve(...).
    a <- NULL

    # Return the actual matrix.
    get <- function() { x }

    # Set the actual matrix.
    set <- function(m = matrix()) {
        # x MUST be a matrix.
        stopifnot(is.matrix(m))

        # x MUST be a square matrix (ie. 1 unique value in its dimensions).
        stopifnot(length(unique(dim(m))) == 1)

        s <<- NULL  # Clear the cached solution.
        x <<- m # Copy the matrix up into the parent environment.
    }

    # Solve() the matrix, possibly returning the cached result.
    msolve <- function(...) {
        # We track the cached solution as well as the arguments provided
        # to solve(). If either change, we have to recalculate.
        if (is.null(s) || !identical(a, list(...))) {
            a <<- list(...)
            s <<- solve(x, ...)
        }

        s
    }

    set(x)

    # Return the "object".
    list(get = get, set = set, solve = msolve)
}

#` cacheSolve(x = makeCacheMatrix(m))
#'
#' @param x A cache matrix object returned by makeCacheMatrix(m)
#'
#' @return Return the (possibly cached) result of solve(x, ...).
cacheSolve <- function(x, ...) {
    x$solve(...)
}
