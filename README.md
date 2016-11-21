# ProjectCEPTION
## A tool for Dev Bootcamp teachers and students to use to pitch, vote on, select, and team up for final projects.
### Deployed on [Heroku](https://projectception.herokuapp.com/)

## Created by:
* [Matt Critelli](https://www.github.com/mattcritelli)
* [Scott Dixon](https://www.github.com/dixonscottr)
* [Lindsay Kelly](https://www.github.com/lindsaymkelly)
* [Jacob Williams](https://www.github.com/jacobgwilliams)

## How to Use:
1. Create an account as either a student or admin (be sure you have the secret key!)
2. Students can publish pitches that other students can view and vote on.
3. While voting commences, admins can track the most popular projects.
4. Admins can then move five projects onto Round 2 from their dashboard.
5. Once in Round 2, students can rank the 5 projects in order from 1-5 (most interested in working on to least interested)
6. Admins can track how Round 2 projects are ranking and then select 3 for Final Projects as well as the students who will participate.
7. When final groups are selected, students will have access to the Final Projects page which shows the projects that were picked, the leaders, and other group members. 
8. Celebrate or mourn, respectively. 

# The Nitty Gritty

## User Stories:
* User should be able to register as student
* User should be able to register as admin/teacher
* As Student: Publish between 0 and 4 pitches
* As Student: View all round 1 pitches without author & without current vote count
* As Student: Be able to vote on 7 pitches (only once per pitch) in first round
* As Teacher: Be able to view all pitches in order of votes with student author displayed
* As Teacher: Be able to choose and publish top five pitches from round 1
* As Student: Be able to view top five pitches in round 2
* As Student: Be able to rank round 2 pitches from 1 to 5
* As Teacher: I should be able to view all round two projects with: Author, Current Overall Rank, as well as which students ranked it and how
* As Teacher: Make final decision on final three projects and who is on what team
* As Student: See final results. See top three projects and the teams.
* THE END :-D Final project greatness ensues...

## Schema:
![schema design](https://github.com/jacobgwilliams/ProjectCEPTION/blob/master/ProjectCEPTION-Schema.png)
