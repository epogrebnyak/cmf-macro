"""Import csv files from web and convert them to pandas dataframes."""

import pandas as pd

def add_index(dfq, dfm):
    # set time index
    dfq.index = pd.to_datetime(dfq.time_index)    
    dfm.index = pd.to_datetime(dfm.time_index)
    return dfq, dfm
    
URL_DIR = "https://raw.githubusercontent.com/epogrebnyak/rosstat-kep-data/master/output/"
DFA_URL = URL_DIR  + "data_annual.txt"
DFQ_URL = URL_DIR  + "data_quarter.txt"
DFM_URL = URL_DIR  + "data_monthly.txt"

dfa = pd.read_csv(DFA_URL, index_col = 0)
dfq = pd.read_csv(DFQ_URL)
dfm = pd.read_csv(DFM_URL)
# set time index
dfq, dfm = add_index(dfq, dfm)

#Example:
RU_CPI <- dfm["CPI_rog"]
USDRUB <- dfm["RUR_USD_eop"]
GDP_nominal <- dfq["GDP_bln_rub"]
housing <- dfa['DWELL_mln_m2']

# For available time series codes see:
# https://raw.githubusercontent.com/epogrebnyak/rosstat-kep-data/master/output/varnames.md

