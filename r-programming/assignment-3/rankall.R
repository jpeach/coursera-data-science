# Write a function called rankall that takes two arguments: an outcome
# name (outcome) and a hospital ranking (num). The function reads the
# outcome-of-care-measures.csv file and returns a 2-column data frame
# containing the hospital in each state that has the ranking specified
# in num.
rankall <- function(outcome, num = 'best') {
    # Read outcome data.
    outcomes <- read.csv('outcome-of-care-measures.csv',
        na.strings='Not Available', stringsAsFactors = FALSE)

    states <- unique(outcomes$State)

    # Check the outcome.
    validOutcomes <- c('heart attack' = 11, 'heart failure' = 17, 'pneumonia' = 23)
    if (is.na(validOutcomes[outcome])) {
        stop('invalid outcome')
    }
    
    # Convert outcome name to column index.
    outcome <- validOutcomes[outcome]

    # Trim the outcomes down to the 3 columns we need
    outcomes <- outcomes[, c(2, 7, outcome)]
    names(outcomes) <- c('name', 'state', 'outcome')

    # Split into a list of per-state data frames.
    outcomes.bystate <- split(outcomes, outcomes$state)
    
    # For each state, find the requested rank. This returns a character
    # vector whose entry names are the states.
    ranked.bystate <- sapply(outcomes.bystate, function(hospitals) {
        # Sort by outcome then hospital name.
        hospitals <- hospitals[order(hospitals$outcome, hospitals$name, na.last = TRUE), ]
        
        # Filter out the NA values
        hospitals <- hospitals[complete.cases(hospitals$outcome), ]

        if (num == 'best') {
            num <- 1
        }

        if (num == 'worst') {
            num <- nrow(hospitals)
        }

        if (is.numeric(num)) {
            return(hospitals$name[num])
        }

        NA
    })
    
    # Return a data frame from the vector.
    data.frame(hospital = ranked.bystate, state = names(ranked.bystate))
}
