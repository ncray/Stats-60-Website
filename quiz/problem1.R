library(rjson)
x <- rnorm(10)
dat <- list("d1" = rpois(1, 5),
            "d2" = rpois(1, 5))
json <- list("data" = dat,
             "answer" = dat$d1 + dat$d2,
             "title" = "Addition problem")
cat(toJSON(json), file = "1.json")
