
#Running the getwd() function gets you the location of where R will save your outputs. In a project this is always the folder you have specified as the project folder.

getwd() # this is the result for me - "/mnt/rdsi/github/CBCS-Hack/test_project"


#nonetheless, saving data without specifying a different folder within your project will still end up being messy (see data files in project folder)
write.csv(mtcars, "mtcars.csv") #save using csv
saveRDS(object = mtcars, file = "mtcars.rds") #save to a more compressed rds version (can read back in with readRDS)


#much better if we put this data into the data folder we created when we first set up the project.

#we can do this using the file.path specification
write.csv(mtcars, file = file.path("/mnt/rdsi/github/CBCS-Hack/test_project/data/mtcars.csv"))
 
 
#but this is a little long winded. The 'here' package 
install.packages("here") #installs the package
library(here)
here() #running this will tell you the same thing as getwd - but it's cool because you can specify the extension to the current working directory in the same

#way as file.path() but it's WAY shorter i.e.,
write.csv(mtcars, file = here("data/mtcars_2.csv"))

#works the same way when you want to read
read.csv(here("data/mtcars_2.csv")) 
 

# here() will only do file paths within your project repo however. Sometimes you want to link to data outside of this i.e. a separate raw_data file. ]
# This can get long doing it all the time though.
read.csv(file.path("/mnt/rdsi/raw_data/fao/FAOSTAT_2022/Production_Crops_Livestock_E_All_Data_(Normalized).csv"))


#As a work around constantly specifying external directories, you can create an R scripts for pre-prepped directories (or functions etc) that you point to using source:
source(here("src/directories.R"))
read.csv(file = file.path(FAOSTAT_dir, "Production_Crops_Livestock_E_All_Data_(Normalized).csv"))
 
 
 
 

 