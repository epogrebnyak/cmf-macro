###
### Интерфейс доступа к базе данных FRED - код на R
### 11.02.2016
### Автор: Александр Писанов
### 
### Использование: 
###      
### GDPC1 <- fred.data.retriever("GDPC1","1947-01-01","2016-10-01")
###
###

####################
# FRED INTERFACE:
####################

# Endpoint and file format setup (in case they change over time):

fred.data.endpoint <- "https://research.stlouisfed.org/fred2/data/"
fred.data.format <- ".txt"

# Retrieval function (currently with no frequency selection option):

fred.data.retriever <- function(data.id,data.start,data.end)
{
  fred.data.file <- paste0(fred.data.endpoint,data.id,fred.data.format)
  data <- readLines(fred.data.file)
  
  # todo: сложное выражение лучше в отельную функцию + непонятно что такое max.frequency
  max.frequency <- unlist(strsplit(gsub(" ","",data[6],fixed=TRUE),split=":"))[2]
  
  y1 <- function(max.frequency)
  {
    if (max.frequency=="Monthly") {x1 <- 1/12}
    else if (max.frequency=="Quarterly") {x1 <- 1/4}
    else if (max.frequency=="Semiannual") {x1 <- 1/2}
    else if (max.frequency=="Annual") {x1 <- 1}
    {return(x1)}
  }

# комментарий непонятный
# NOTES: data.frequency <- max.frequency should be deleted.  
    
  data.frequency <- max.frequency
  y2 <- function(data.frequency)
  {  
    if (data.frequency=="Monthly") {x2 <- 1/12}
    else if (data.frequency=="Quarterly") {x2 <- 1/4}
    else if (data.frequency=="Semiannual") {x2 <- 1/2}
    else if (data.frequency=="Annual") {x2 <- 1}
    {return(x2)}
  }
  
  max.frequency <- y1(max.frequency)
  data.frequency <- y2(data.frequency)
  
  # два выраженияниже - в отедльные функции 
  min.start <- as.Date(substring(gsub(" ","",data[8],fixed=TRUE),11,20))
  max.end <- as.Date(substring(gsub(" ","",data[8],fixed=TRUE),23,32))
  
  # тоже в отдельную функцию с комментарием
  if (!((data.frequency>=max.frequency)&(min.start<=data.start)&(max.end>=data.end))) err <- 1 else err <-0
  if (err>0) stop("Check date (data.start/end) and/or frequency (data.frequency) parameters. Date should be not less that the series start date; frequency should be not higher")
  
  parse <- gsub(" ","",data,fixed=TRUE)
  parse.index <- match("DATEVALUE",parse)
  parse.data <- data[-(1:parse.index)]
  parse.data.vector <- substring(gsub(" ","",parse.data,fixed=TRUE),11,100)
  
  y3 <- function(max.frequency)
  {
    if (max.frequency==1) {x3 <- as.numeric(format(as.POSIXct(min.start),"%Y"))}
    else if (max.frequency<1) {x3 <- c(as.numeric(format(as.POSIXct(min.start),"%Y")),as.numeric(format(as.POSIXct(min.start),"%m")))}
    {return (x3)}
  }
  
  ts.data <- ts(data=parse.data.vector,start=y3(max.frequency),deltat=max.frequency)

# если это просто чатсота - почему она не называется frequency? пусть сейчас будет frequency = max.frequency
# NOTES: hereinafter, max.frequency should be changed to data.frequency to allow for frequency selection.
  
  y4 <- function(max.frequency)
  {
    if (max.frequency==1) {x4 <- as.numeric(format(as.POSIXct(data.start),"%Y"))}
    else if (max.frequency==1/4) {x4 <- c(as.numeric(format(as.POSIXct(data.start),"%Y")),as.numeric(paste0(0,substring(quarters.POSIXt(data.start),2,2))))}
    else if (max.frequency==1/12) {x4 <- c(as.numeric(format(as.POSIXct(data.start),"%Y")),as.numeric(format(as.POSIXct(data.start),"%m")))}
    {return(x4)}
  }
  
  y5 <- function(max.frequency)
  {
    if (max.frequency==1) {x5 <- as.numeric(format(as.POSIXct(data.end),"%Y"))}
    else if (max.frequency==1/4) {x5 <- c(as.numeric(format(as.POSIXct(data.end),"%Y")),as.numeric(paste0(0,substring(quarters.POSIXt(data.end),2,2))))}
    else if (max.frequency==1/12) {x5 <- c(as.numeric(format(as.POSIXct(data.end),"%Y")),as.numeric(format(as.POSIXct(data.end),"%m")))}
    {return(x5)}
  }
  
  output <- window(ts.data,start=y4(max.frequency),end=y5(max.frequency))
    
  {return (output)}
}

# Example:
GDPC1 <- 0 # To return zero if the function fails.
GDPC1 <- fred.data.retriever("GDPC1","1947-01-01","2016-10-01") # Using the function to get quarterly US real GDP data. Series start date is set as 1937-01-01.
GDPC1 # Zero with an error message.

GDPC1 <- 0 # To return zero if the function fails.
GDPC1 <- fred.data.retriever("GDPC1","1947-01-01","2015-08-01") # Retrying with correct date range.
GDPC1 # Data was retrieved successfully.

####################
# YOUR CODE:
####################
