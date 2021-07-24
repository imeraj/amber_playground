require "clear"

# initialize a pool of database connection:
Clear::SQL.init("postgres://meraj@localhost/pet_tracker_development")
