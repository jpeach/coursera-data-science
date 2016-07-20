best <- function(state, outcome) {
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

    # Sort by outcome then hospital name.
    hospitals <- hospitals[order(hospitals$outcome, hospitals$name, na.last = TRUE), ]

    ## Return hospital name in that state with lowest 30-day death rate
    hospitals$name[1]
}
