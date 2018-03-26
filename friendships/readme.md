Assignment: Friendships
Using the below ERD, write the SQL query that returns a list of users along with their friends' names.

![alt tag](https://user-images.githubusercontent.com/32435667/37921758-a9c7c9de-30f8-11e8-908b-ce98b745137c.png)
Create the tables and populate them with some fake data.  Your results should look like below:

first_name	last_name	friend_first_name	friend_last_name
Chris	Baker	Jessica	Davidson
Chris	Baker	James	Johnson
Chris	Baker	Diana	Smith
Diana	Smith	Chris	Baker
James	Johnson	Chris	Baker
Jessica	Davidson	Chris	Baker
Your actual query will look something similar to this:

SELECT * FROM users 
LEFT JOIN friendships ON ____=____ 
LEFT JOIN users as user2 ON ____ = ____
Take note that we're joining the users table again but we're specifying the second users table as user2.  You can then reference the second users by calling user2 (e.g. user2.id, user2.first_name, etc).  

You can also rename the fields that are displayed on the result by using the as keyword, like the below example:   

SELECT user2.first_name as friend_first_name, user2.last_name as friend_last_name, ...  FROM ...