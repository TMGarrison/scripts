# Initial RScript for aggregating across files of data 
# Version: 2.0
# Last Revision Date: 12/9/16
# Last Written/Revised by: Teena Garrison

# Loads reduced data files then appends unique data from across files -- removes overlapping data
# Runs ridiculously slow -- exists for reference only.

# Details removed from original script version -- Example only

# Note: All lines marked with '#' are comments and are not processed by R.

#begin Rscript

# Load previously saved reduced data files (teena_cleanup.pl + readData.r)
load(file='I:/hse/data1/hfe/common/projects/reducedData_4-13-16.rda') #Track
load(file='I:/hse/data1/hfe/common/projects/reducedData_4-19-16.rda') #Track2

i = max(Track$EventID) #sets check to max value in initial set

y = 1 #sets iterator for second file

TrackAgg<-tugTrack #copies initial set
x<-Track2[y,]

for (j in 1:length(Track2$EventID)){
  if (x$EventID > i){ 
     TrackAgg<-rbind(TrackAgg,x)
     y = y+1
     x<-Track2[y,]
    }
    else { 
      y = y+1
      x<-Track2[y,]
    }
  }

# load(file='I:/hse/data1/hfe/common/projects/reducedData_4-26-16.rda') #Track3
# load(file='I:/hse/data1/hfe/common/projects/reducedData_5-04-16.rda') #Track4