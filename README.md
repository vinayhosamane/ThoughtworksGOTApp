# ThoughtworksGOTApp

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

