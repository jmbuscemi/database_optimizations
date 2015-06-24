# Database Optimizations

## Description

Provide lists of DNA Sequence baed on Assembly name from a large database.

## Email Notification
Because these database calls tend to produce rather large lists pages, and as more and more DNA Sequence data gets added to the database these list swill take longer and longer to load on a browser.  For this reason, email notifications have been added to the app.  The user will submit a request for a specific assembly by name, on the welcome page, along with the email address where they'd like to receive the list of hits for that name.  Once the request completes an email will be sent with the information.


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
