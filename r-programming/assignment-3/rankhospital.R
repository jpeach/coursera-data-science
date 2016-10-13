# The function reads the outcome-of-care-measures.csv file and
# returns a character vector with the name of the hospital that
# has the ranking specified by the num argument
rankhospital <- function(state, outcome, num = 'best') {
    # Read outcome data.
    outcomes <- read.csv('outcome-of-care-measures.csv',
        na.strings='Not Available', stringsAsFactors = FALSE)

    # Check the outcome.
    validOutcomes <- c('heart attack' = 11, 'heart failure' = 17, 'pneumonia' = 23)
    if (is.na(validOutcomes[outcome])) {
        stop('invalid outcome')
    }

    # Check the state.
    if (!state %in% outcomes$State) {
        stop('invalid state')
    }

    # Convert outcome name to column index.
    outcome <- validOutcomes[outcome]

    # Select the hospitals in the state. Column 2 is the name, and 7 is the state.
    hospitals <- outcomes[outcomes$State == state, c(2, 7, outcome)]
    names(hospitals) <- c('name', 'state', 'outcome')

    # Filter out the NA values
    hospitals <- hospitals[complete.cases(hospitals$outcome), ]

    # Sort by outcome then hospital name.
    hospitals <- hospitals[order(hospitals$outcome, hospitals$name, na.last = TRUE), ]

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
}
