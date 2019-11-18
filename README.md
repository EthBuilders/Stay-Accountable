# Stay-Accountable
Accountability Dapp where people stake money to reach goals

Draft
Overview:
Its a play aka program
Version 1:l
Lets assume everyone is honest.
Who are our actors? What are the objects/model
  Student
   Verifier
Lets assume good faith:
        As long as student is not verifying self, its good.
        One thumbs is teacher, other is other student.
    
Whats the play about? Whats the contract about?
  let's make a bet.
  The student will self assess how much 
  they can reasonably study in a week.
  If the student either: 
    fails to reach goal by not providing evidence or not showing up, they lose their stake.
         
 What do the actors do? What are the roles of obj/models?
  Student:
    Makes the bet aka stakes eth
    shows up/signs in
    v1. sign in with metamask
      point to proof -> point to IPFS hash

  Verifier:
    show up/sign in
     sign into app via metamask
     can verify student
      v1. Thumbs up or thumbs down
     Can verify other verifiers

  How many verifiers do we need, redundency?
    Just two verifier.
     Both need to do thumbs on student
            
  What data types can we use to represent obj/models?
        Probably going to be a struct...
        
  UI considerations:
  get inspired: kickback.events feel.
  1st page:
    all students
  2nd page: 
    specific student and goals
     each has a box with date, time and goal
     streak- Make it look like a tree.
      v2. comments on each goal.

next goals:
    upload to meetup github
    finish functions
    revise to make sure that it acutally compiles
    give it a second look to see what needs to be fixed.
    Deploy
    Begin to talk about v1.1....
    v2. 
      Factory contract for each class
      3Box
      Comments
