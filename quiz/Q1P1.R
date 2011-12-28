library(rjson)
library(RCurl)

genQ1P1 <- function(seed){
  set.seed(seed)
  x <- rpois(2, 5)
  y <- rpois(2, 2)
  question <- paste("What is the sample mean of (",
                    paste(x, collapse = ", "),
                    ") minus the sample mean of (",
                    paste(y, collapse = ", "),
                    ")",
                    sep = "")
  answer <- mean(x) - mean(y)
  list("question" = question, "answer" = answer, "title" = "Q1P1")
}
lapply(1:10, genQ1P1)
js <- list()
js[["Q1P1"]] <- lapply(1:10, genQ1P1)

uuid <- fromJSON(system("curl -X GET http://127.0.0.1:5984/_uuids", intern = TRUE))$uuids
system(paste("curl -X PUT http://127.0.0.1:5984/stat60/", uuid, " -d '", toJSON(js), "'", sep = ""), intern = TRUE)
