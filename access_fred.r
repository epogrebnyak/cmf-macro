## Retrieve zoo time series from FRED by parsing online csv files (no API key)    
##
## Data source: https://research.stlouisfed.org/fred2/
##
## Author(s): Evgeniy Pogrebnyak, Alexander Pisanov
## Code: https://github.com/pisanovav/fred_interface
## 
## Entry points:
##     id = 'CPIAUCSL'
##     get_fred_zoo(id)
##     fred_to_csv(id)
##
## Alternatives: 
## - getSymbol() from quantmod library
## - https://github.com/sboysel/fredr
## - parse XML from FRED API

library(RCurl)
library(zoo) 

get_id = function(data)
{
   # "Series ID:           CPIAUCSL"
   return(sub("Series ID:\\s+", "", data[2]))
}

get_endpoints = function(data)
{
  # "Date Range:          1947-01-01 to 2015-12-01"
  txt = data[8]
  pat = "\\d{4}-\\d{2}-\\d{2}" 
  matches = as.Date(regmatches(txt,gregexpr(pat,txt))[[1]])
  return(matches)
}

# Get content of a .txt file specified by 'id' from the FRED website  
get_content_lines <- function(id)
  {   
  fred.data.urlbase  <- "https://research.stlouisfed.org/fred2/data/"
  fred.data.extension <- ".txt"
  filename <- paste0(fred.data.urlbase,id,fred.data.extension)
 
  # need getURL because readLines() fails on https://
  big_string <- getURL(filename, ssl.verifypeer=0L, followlocation=1L)
  lines <- strsplit(big_string, '\r\n')[[1]]
 
  return(lines)
  }

# wrapper to check lines are valid 
get_lines <- function(id)
  {
  lines <- get_content_lines(id)

  # if id is invalid, we get an HTML document
  if (lines[1] == "<!DOCTYPE html>") 
     stop(paste("Invaid time series id: ", id))

  # some legacy check
  if (get_id(lines) != id)
     stop(paste("id queried and obtained do not match: ", id, data.id))
  
  return(lines)
} 

# get parts of .txt file as list of strings or dates
components <- function(id)
  {
  data = get_lines(id)
  cut = charmatch("DATE", data)
  return(list("start" = get_endpoints(data)[1],  # start date 
              "end"   = get_endpoints(data)[2],  # most recent (end) date
              "desc"  = data[1:(cut-1)],  # time series text description
              "lines" = data[-(1:cut)]    # string lines with data
         ))
   }

get_fred_zoo <- function(id, start_dt = NULL, end_dt = NULL)
  {
  q = read.table(text = components(id)$lines, stringsAsFactors = FALSE) 
  zts = zoo(q[,2], as.Date(q[,1]))
  return (window(zts, start = start_dt, end = end_dt))
}

fred_to_csv = function(id)
{
  fn = paste0(id,".csv")
  zts = get_fred_zoo(id)
  write.csv(zts,file=fn,row.names=TRUE)
  warning(paste("Wrote ", fn, " to current working directory: ", getwd()))
  return(file.path(getwd(),fn)) 
}
