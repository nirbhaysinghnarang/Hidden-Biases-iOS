//
//  DScore.swift
//  implicitRacismTest
//
//  Created by Nirbhay Singh on 04/07/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import Foundation

func calc(t3:[Double],t4:[Double],t6:[Double],t7:[Double]) -> String
{
    var t3Times = t3
    var t4Times = t4
    var t6Times = t6
    var t7Times = t7
    
    for times in t3Times {
        if times>10.00{
            let index = t3Times.firstIndex(of: times)
            t3Times.remove(at: index!)
        }
    }

    for times in t4Times {
        if times>10.00{
            let index = t4Times.firstIndex(of: times)
            t4Times.remove(at: index!)
        }
    }

    for times in t6Times {
        if times>10.00{
            let index = t6Times.firstIndex(of: times)
            t6Times.remove(at: index!)
        }
    }

    for times in t7Times {
        if times>10.00{
            let index = t7Times.firstIndex(of: times)
            t7Times.remove(at: index!)
        }
    }


    //Mark subjects who have greater than 10% of their trials with a response time of .3 seconds. These subjects should have their test invalidated because they tapped too fast (Step2)
    var count = 0
    for times in t3Times {
        if times<0.3{
           count+=1
        }
    }
    for times in t4Times {
        if times<0.3{
           count+=1
        }
    }
    for times in t6Times {
        if times<0.3{
           count+=1
        }
    }
    for times in t7Times {
        if times<0.3{
           count+=1
        }
    }
    if count>=6{ //got the number 6 because there are 60 trials in total and 6 is 10%
        return("subject invalid") //Can you find a way to make the results screen say sorry you tapped too fast or something?
    }

    //Step 3.
    //Combining arrays of 3&6 and 4&7. There should be two arrays and then the program will take the standard deviation and record for both arrays
    //Standard deviation formula found at https://www.mathsisfun.com/data/standard-deviation-formulas.html
    var pooledarray1:[Double] = []
    pooledarray1 += t3Times
    pooledarray1 += t6Times //combining both arrays
    var mean = 0.0
    for times in pooledarray1 {
        mean+=times
    }
    mean = mean/20 //mean of array1. dividing by 20 because there should be 20 data points
    for times in pooledarray1 { //step2 in standarddev formula
        let index = pooledarray1.firstIndex(of: times)
        pooledarray1[index!] = pooledarray1[index!] - mean //substract old mean
        pooledarray1[index!] = pooledarray1[index!] * pooledarray1[index!] //square elements
    }
    mean = 0.0
    for times in pooledarray1 { //finding new mean
        mean+=times
    }
    mean = mean/20
    var inclusivestd3and6 = sqrt(mean) //Final inclusive standard deviation for stages 3 and 6!



    var pooledarray2:[Double] = [] // Finding inclusive std for stages 4 and 7
    pooledarray2 += t4Times
    pooledarray2 += t7Times //combining both arrays
    mean = 0.0
    for times in pooledarray2 {
        mean+=times
    }
    mean = mean/40 //mean of array1. dividing by 40 because there should be 40 data points
    for times in pooledarray2 { //step2 in standarddev formula
        let index = pooledarray2.firstIndex(of: times)
        pooledarray2[index!] = pooledarray2[index!] - mean
        pooledarray2[index!] = pooledarray2[index!] * pooledarray2[index!]
    }
    mean = 0.0
    for times in pooledarray2 { //finding new mean
        mean+=times
    }
    mean = mean/40
    var inclusivestd4and7 = sqrt(mean) //Final inclusive standard deviation for stages 4 and 7!



    //Step 4. Finding mean response time of each stage
    mean = 0.0
    for times in t3Times { //finding mean stg3
        mean+=times
    }
    var meanstg3 = mean/10
    mean = 0.0
    for times in t4Times { //finding mean stg4
        mean+=times
    }
    var meanstg4 = mean/10
    mean = 0.0
    for times in t6Times { //finding mean stg6
        mean+=times
    }
    var meanstg6 = mean/10
    mean = 0.0
    for times in t7Times { //finding mean stg7
        mean+=times
    }
    var meanstg7 = mean/10


    // Step5 Finding two mean differences
    var meandiff1 = meanstg6 - meanstg3
    var meandiff2 = meanstg7 - meanstg4

    //Step6. Dividing mean difference scores by associated inclusivestd
    var ratio1 = meandiff1 / inclusivestd3and6
    var ratio2 = meandiff2 / inclusivestd4and7

    //Step7 Avergage of dscores (previous step)
    var dscore = ((ratio1+ratio2)/2)

    //Step8 Final Percentage
        var dscorepercentage = (dscore/2) * 100 //convert to percentage (out of 2 bc that's dscore range)
    if dscorepercentage >= 10.01 && dscorepercentage<=30 {
        return("You have a slight preference for European Americans over African Americans")
        }
    if dscorepercentage >= 30.01 && dscorepercentage<=60 {
           return("You have a moderate preference for European Americans over African Americans")
        }
    if dscorepercentage >= 60.01 && dscorepercentage<=100{
       return("You have a heavy preference for European Americans over African Americans")
        }
    if dscorepercentage >= -10 && dscorepercentage <= 10 && dscorepercentage != 0{
        return("You have near no automatic bias")
    }
    if dscorepercentage <= -10.01 && dscorepercentage >= -30 {
        return("You have a slight preference for African Americans over European Americans")
        }
    if dscorepercentage <= -30.01 && dscorepercentage >= -60 {
           return("You have a moderate preference for African Americans over European Americans")
        }
    if dscorepercentage <= -60.01 && dscorepercentage >= -100{
       return("You have a heavy preference for African Americans over European Americans")
        }
    if dscorepercentage == 0 {
    return("Congrats, you have acheived the rare feat of zero bias to the hundredth decimal on this test! Please email rishi09123@gmail.com.")
     }
    if dscorepercentage > 100 || dscorepercentage < -100{
        return("Hmm our test seems to be broken. Please email rishi09123@gmail.com and retake this test.")
    }
    return "Hmm our test seems to be broken. Please email rishi09123@gmail.com and retake this test."
}
