# Database Optimizations

## Description

Given an existing application which generates a report from a large data set, improve the efficiency of the report using database optimization methods.

## Metrics

### Seed/Run times
* Original `rake db:seed` time = 25min
* Original localhost runtime = 138sec
* Migration time after adding indices = 1.1sec
* Localhost runtime after indices = 5.04sec
  * 96% faster
* Runtime after code optimization = 4.3sec
  * 14% faster than previous runtime.
* After optimizations it took 1 min. longer (4% increase) to run `rake db:seed`. This was because now there are more indices that are being added to the database to make it into binary tree database.
* Based on this exercise, it was nearly the same amount of time to run `rake db:seed` both before and after adding indices. So changing the database to have indices after it has been seeded did not cost much so and returned a dramatic increase in browser runtime, so I think that would be the way to go.  Seed without indices and then add indices as needed.

### DB Size
* Database size = 569,802,752 bytes (5.69 MB)
* Development log size = 1,472,182,665 bytes (1.47 GB)
* One way to reduce the database size would be to tune your indices and removed unused or redundant indies.  This would requite some regression testing which I know not how to do.  But am kind of interested in from a mathematical standpoint.  Maybe my future job implements such a thing and I can learn!
* This data seems much smaller than what I could be working with in the future. Although there are a lot of records, these records are really just strings.  No large files.  In today's world, a couple GB is really nothing at all.
