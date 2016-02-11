## Version: 2.1; release date: 12.02.2016; developer: Alexander Pisanov (any questions - please, email on pisanov.alexander@gmail.com).
## Description: 2 functions: fred.data.description(id), fred.data.value(id,start,end,csv).
## Parameters: id - series id from FRED website; start; end; csv - 1 if you want a .csv file to be written on your disk, 0 if not.
## Syntax: x1 <- fred.data.description("GDPC1"); x2 <- fred.data.value("GDPC1","1947-01-01","2016-01-01",1).
## Output: x1 - character vector, x2 - numeric vector, .csv file with dates and values delimited.
## WARNING: correct work with submonthly frequencies is not guaranteed.

####################
#FRED INTERFACE:####
####################

# WORKING FOLDER, FRED ENDPOINT AND FILE FORMAT SETUP:

library(zoo) # Zoo library is required.

my.working.folder <- setwd("C:/Users/Alexander Pisanov/Desktop")
fred.data.endpoint <- "https://research.stlouisfed.org/fred2/data/"
fred.data.format <- ".txt"

# DATA DESCRIPTION FUNCTION:

fred.data.description <- function(id)
{
  err <- 0
  
  fred.data.file <- paste0(fred.data.endpoint,id,fred.data.format)
  data <- readLines(fred.data.file)
  data.id <- unlist(strsplit(gsub(" ","",data[2],fixed=TRUE),split=":"))[2]
  
  if (!(data.id==id)) err <- err+1 else err
  if (!(data.id==id)) print("Error: 'fred.data.file' time series id doesn't match the id set by user. Please, report to the developer.")
  
  parse <- gsub(" ","",data,fixed=TRUE)
  parse.index <- match("DATEVALUE",parse)-1
  data.parse <- data[1:parse.index]
  
  if (err>0) output <-0 else output <- data.parse
  
  {return(output)}
}

# DATA VALUES FUNCTION:

fred.data.values <- function(id,start,end,csv)
{
  err <-0
  
  # This function block gets and parses the .txt file into a numeric vector "data.parse":
  
  fred.data.file <- paste0(fred.data.endpoint,id,fred.data.format)
  data <- readLines(fred.data.file)
  data.id <- unlist(strsplit(gsub(" ","",data[2],fixed=TRUE),split=":"))[2]
  data.start <- as.Date(substring(gsub(" ","",data[8],fixed=TRUE),11,20))
  data.end <- as.Date(substring(gsub(" ","",data[8],fixed=TRUE),23,32))
  
  if (!(data.id==id)) {err <- err+1;print("Error: 'fred.data.file' time series' id doesn't match the id set by user. Report to the developer.")} else err
  if (!((data.start<=start)&(data.end>=end))) {err <- err+1;print("Error: check dates (start/end) parameters. Start/end date should be in time-series' date range. Output is set to zero. You can use 'fred.data.description' function for date range info.")} else err <- err
  
  parse <- gsub(" ","",data,fixed=TRUE)
  parse.index <- match("DATEVALUE",parse)
  parse <- data[-(1:parse.index)]
  date.parse <- as.Date(substring(gsub(" ","",parse,fixed=TRUE),1,10))
  data.parse <- as.numeric(substring(gsub(" ","",parse,fixed=TRUE),11,100))
  
  # This function block converts "data.parse" into a "zoo" object and trims out the window of a requested width, outputs the window and writes .csv file if csv=1.
  
  zoo.data <- zoo(data.parse,order.by=date.parse)
  if (err>0) output <-0 else {output <- as.matrix(window(zoo.data,start=start,end=end));colnames(output) <- id}
  if (csv>0) {write.table(zoo(output,order.by=index(output)),file=paste0(id,".csv"),row.names=TRUE,sep=";",dec=",");print(paste0(id,".csv was written to ",my.working.folder,"."))} else print(".csv was not requested.")
  
  {return (output)}
}

# EXAMPLE:
GDPC1 <- fred.data.description("GDPC1") # Series' id is set as a parameter.
GDPC1 # Data sescription should have been retrieved successfully.

GDPC1 <- fred.data.values("GDPC1","1947-01-01","2016-01-01",0) # Series' end date is set incorrectly, .csv disabled.
GDPC1 # Zero with an error message.

GDPC1 <- fred.data.values("GDPC1","1947-01-01","2015-09-01",1) # Retrying with a correct date range, .csv enabled.
GDPC1 # Data values should have been retrieved successfully.

####################
#YOUR CODE HERE:####
####################

## TODO: submonthly frequencies, aggregation.
