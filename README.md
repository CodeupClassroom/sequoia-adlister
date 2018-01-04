## ADLISTER PROJECT

Alishia - Mary - Abby   
Will Demo on **01/12/18**   
6 minute presentations  
use html, css, javascript, and java    

## RESOURCES

## **Amazon's Interesting Finds Style**        
#### https://www.amazon.com/stream

### _Styling - Minimal, clean_
For Color Schemes:      
https://coolors.co

For Stockphotos:    
lorempixel.com
loremflicker.com   

To create diagrams and flowcharts:      
https://www.draw.io

For Designing Structures/Databases/Page Navigation:     
https://www.mindmup.com/#storage

For Creating Wire Frames:       
https://wireframe.cc/  
  
Reference for Github Project Management:   
  - make tasks cards  
  - move tasks around   
  - use - [] to make checkbox   
  - assign "issue" tasks for team members 
  
  
  
## TO-DO LIST  

### Ad show page  
Create a page that shows the information about an individual ad. This page should show all the information about that ad, as well as the information about the user that posted the ad. 
Your ads index page should contain links to each individual ad page.  
You should have one page that displays the information for any arbitrary ad. Consider passing the id of the ad as a parameter in the GET request to this page.  

### Search
Implement functionality that allows users to search through the ads in your database.   
Show user's ads on their profile page   
When a user visits their profile page, they should see all of the ads they have created.  

### Ensure usernames are unique
Change your database schema to enforce that values in the username column of the user table are unique. Make sure a new account cannot be created with an existing username.  

### Clean up the code
You'll notice there is some duplicated code in our ads DAO and our users DAO. How could you create an abstraction for this? 

### Dynamic navbar
Wouldn't it be nice if our navbar showed different links depending on if a user was logged in or out?   

### Allow users to update and delete ads
You will need to make some changes to the frontend so that users can discover this functionality, as well as implement the backend logic necessary to update your database.   

### Allow users to update their profile information.

### Validate data
Ensure that the data we get from our users is valid before saving it to the database. Consider creating some classes related to validation.   

### Error messages
Isn't it frustrating when a site won't let you submit a form but won't tell you why? Implement functionality to display error messages to users if they do something wrong, for example, if they try to register but their passwords don't match, or if they try to create a ad without a title.     
Consider storing error messages temporarily in the session and having a messages.jsp partial to handle this.    

### Sticky Forms   
When a submission is rejected because one or more of our validation constraints fails, we should still see the old values in the form for creating an ad, the users' input should not be erased.    

### Allow an Ad to have many categories    
Create a catagories table and implement all the backend logic necessary to tie a category to an ad. This should be a many to many relationship (an ad can have many categories, and a category can have many ads associated with it).   

### Make it pretty!
While bootstrap is very helpful, our site could look much better than an out of the box bootstrap website. Recall your CSS prowess and style it up!   

## HTML
1.  
2.  
3.  

## CSS
1.  
2.  
3.  
  
## JS
1. animation hover   
2.  
3.  

## Java
1.  
2.  
3.  