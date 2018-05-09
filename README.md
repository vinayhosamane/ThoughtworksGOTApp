# ThoughtworksGOTApp

## PROBLEM STATEMENT

Game of Thrones is over. And this is how each king fared in the different battles. 
http://starlord.hackerearth.com/gotjson

Show a list of all the Kings involved in the various battles with their ELO ratings  and some more details (Attack, Defend and Victory scores)

A user can look at the details of each individual king. The details view will show the sigil (image) as a banner and a list of wars each one fought in. 

ELO Rating:
https://en.wikipedia.org/wiki/Elo_rating_system

The first step is to compute the transformed rating for each player or team:
R(1) = 10^(r(1)/400)
R(2) = 10^(r(2)/400)
This is just to simplify the further computations. 

In the second step we calculate the expected score for each player:
E(1) = R(1) / (R(1) + R(2))
E(2) = R(2) / (R(1) + R(2))
Now we wait for the match to finish. 

In the third step, we actually set the score:
S(1) = 1 if player 1 wins / 0.5 if draw / 0 if player 2 wins
S(2) = 0 if player 1 wins / 0.5 if draw / 1 if player 2 wins

Now we can put it all together and in a fourth step find out the updated Elo-rating for each player:
r'(1) = r(1) + K * (S(1) – E(1))
r'(2) = r(2) + K * (S(2) – E(2))

Take K as a constant value 32. And initial rating as 400.


[ELO Rating Calculation](https://en.wikipedia.org/wiki/Elo_rating_system)

    //4 Steps in ELO Calculation
   
     r1 -> rating of player 1
     r2 -> rating of player 2
     Step 1:
     R1 = 10 ^^ (r1/400)
     R2 = 10 ^^ (r2/400)
     
     Step 2:
     E1 = R1 / (R1 + R2)
     E2 = R2 / (R1 + R2)
     
     Step 3:
     S1 = 1(win) = 0(lose) = 0.5(draw)
     S2 = 1(win) = 0(lose) = 0.5(draw)
     
     Step 4: Updated Elo Rating   Where k = 32
     r'1 = r1 + k (S1 - E1)
     r'2 = r2 + k (S2 - E2)
    


<img width="232" alt="rsz_screenshot_2018-05-08_004833" src="https://user-images.githubusercontent.com/12964593/39720799-0b13d4c0-525b-11e8-84e8-8eb1af4b6be5.png">  <img width="232" alt="rsz_screenshot_2018-05-08_004835" src="https://user-images.githubusercontent.com/12964593/39720858-3d181684-525b-11e8-8639-2ae3b57690c2.png">

