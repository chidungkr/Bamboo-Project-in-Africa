


#======================================
# create a connection with PostgreSQL
#======================================

# loads the PostgreSQL driver: 
library("RPostgreSQL")
drv <- dbDriver("PostgreSQL")

# creates a connection to the postgres database. Note that "con" 
# will be used later in each connection to the database: 

con <- dbConnect(drv, 
                 dbname = "db_bamboo",
                 host = "test.gfd.com.vn", 
                 port = 5432,
                 user = "dungtiensinh", 
                 password = "12@45")


# check for the cartable: 
dbExistsTable(con, "tbl_points")

#=============================
# Import data from data base
#=============================

df_postgres <- dbGetQuery(con, "SELECT * from tbl_points")

# close the connection: 
dbDisconnect(con)

# Inspect our data: 
df_postgres %>% head()
df_postgres %>% dim()
df_postgres %>% names()
df_postgres$country %>% table()
