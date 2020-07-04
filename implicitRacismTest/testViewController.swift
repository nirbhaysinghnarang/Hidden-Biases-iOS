//
//  testViewController.swift
//  implicitRacismTest
//
//  Created by Nirbhay Singh on 16/06/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit
var res:String!
class testViewController: UIViewController {
    @IBOutlet weak var wordLbl: UILabel!
    @IBOutlet weak var wrongLbl: UILabel!
    @IBOutlet weak var faceImg: UIImageView!
    @IBOutlet weak var prompt: UILabel!
    var roundCounter = 1
    @IBOutlet weak var stageLbl: UILabel!
    var stageCounter = 0
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    var images=["bf1","wf2","wf3","bm1","bm3","wf1","bf3","wm1","bm2","wm2","wm3","bf2"]
    let posWords:[String] = ["Love","Cheer","Friend","Pleasure","Adore","Cheerful","Friendship","Joyful","Smiling","Cherish","Excellent","Glad","Joyous","Spectacular","Appealing","Delight","Excitement","Laughing","Attractive","Delightful","Fabulous","Glorious","Pleasing","Beautiful","Fantastic","Happy","Lovely","Terrific","Celebrate","Enjoy","Magnificent","Triumph"]
    let negWords:[String] = ["Abuse", "Grief", "Poison", "Sadness", "Pain", "Despise", "Failure", "Nasty", "Angry", "Detest", "Horrible", "Negative", "Ugly", "Dirty", "Gross", "Evil", "Rotten","Annoy", "Disaster", "Horrific", "Scorn", "Awful", "Disgust", "Hate", "Humiliate", "Selfish", "Tragic", "Bothersome", "Hatred", "Hurtful", "Sickening", "Yucky"]
    var words:[String]!
    var start:Date!
    var wordState:Int!
    var imgCount:Int!
    var combined:[String]=[]
    var wordCount:Int!
    var t3Times:[Double]=[]
    var t4Times:[Double]=[]
    var t6Times:[Double]=[]
    var t7Times:[Double]=[]
    override func viewDidLoad() {
        wrongLbl.isHidden = true
        wordLbl.isHidden = true
        words = posWords+negWords
        words = words.shuffled()
        combined = words+images
        combined = combined.shuffled()
        wordState = Int.random(in: 0...1)
        images = images.shuffled()
        setImg(img: images[stageCounter])
    }
    @IBAction func rightPressed(_ sender: Any) {
        wrongLbl.isHidden = true
        if(roundCounter==1){
            if(images[stageCounter].hasPrefix("w")){
                print("correct")
                stageCounter+=1
                stageUp(stageCounter:stageCounter,round:roundCounter)
            }else{
                print("wrong")
                wrongLbl.isHidden = false
            }
        }else if(roundCounter==2){
            if(posWords.contains(words[stageCounter])){
                print("correct")
                stageCounter+=1
                stageUp(stageCounter: stageCounter,round:roundCounter)
            }else{
                print("wrong")
                wrongLbl.isHidden = false
            }
        }
        else if(roundCounter==3){
            if((posWords.contains(words[stageCounter]) && self.wordState==1)||(images[stageCounter].hasPrefix("w") && self.wordState==0)){
                print("correct")
                stageCounter+=1
                let now=Date()
                t3Times.append(now.timeIntervalSince(start))
                self.start = Date()
                stageUp(stageCounter: stageCounter,round:roundCounter)
            }else{
                print("wrong")
                wrongLbl.isHidden = false
            }
        }else if(roundCounter==4){
            let item = combined[stageCounter]
            if(words.contains(item)){
                if(posWords.contains(item)) {
                    print("correct")
                    let now = Date()
                    t4Times.append(now.timeIntervalSince(start))
                    start = Date()
                    stageCounter+=1
                    stageUp(stageCounter: stageCounter,round:roundCounter)
                }else{
                    print("wrong")
                    wrongLbl.isHidden = false
                }
            }else{
                if(item.hasPrefix("w")){
                    print("correct")
                    stageCounter+=1
                    let now = Date()
                    t4Times.append(now.timeIntervalSince(start))
                    print("appended")
                    start = Date()
                    stageUp(stageCounter: stageCounter,round:roundCounter)
                }else{
                    print("wrong")
                    wrongLbl.isHidden = false
                }
            }
        }else if(roundCounter==5){
            if(images[stageCounter].hasPrefix("b")){
                print("correct")
                stageCounter+=1
                stageUp(stageCounter: stageCounter,round:roundCounter)
            }else{
                print("wrong")
                wrongLbl.isHidden = false
            }
        }
        else if(roundCounter==6){
        if((negWords.contains(words[stageCounter]) && self.wordState==1)||(images[stageCounter].hasPrefix("w") && self.wordState==0)){
                   print("correct")
                   stageCounter+=1
                    let now=Date()
                    t6Times.append(now.timeIntervalSince(start))
                    self.start = Date()
                   stageUp(stageCounter: stageCounter,round:roundCounter)
               }else{
                   print("wrong")
                   wrongLbl.isHidden = false
               }
        }else if(roundCounter==7){
            let item = combined[stageCounter]
            if(words.contains(item)){
                if(negWords.contains(item)) {
                    print("correct")
                    let now = Date()
                    t7Times.append(now.timeIntervalSince(start))
                    start = Date()
                    stageCounter+=1
                    stageUp(stageCounter: stageCounter,round:roundCounter)
                }else{
                    print("wrong")
                    wrongLbl.isHidden = false
                }
            }else{
                if(item.hasPrefix("w")){
                    print("correct")
                    stageCounter+=1
                    let now = Date()
                    t7Times.append(now.timeIntervalSince(start))
                    print("appended")
                    start = Date()

                    stageUp(stageCounter: stageCounter,round:roundCounter)
                }else{
                    print("wrong")
                    wrongLbl.isHidden = false
                }
            }
        }

    }
    @IBAction func leftPressed(_ sender: Any) {
        wrongLbl.isHidden = true
        if(roundCounter==1){
            if(images[stageCounter].hasPrefix("b")){
                print("correct")
                stageCounter+=1
                stageUp(stageCounter: stageCounter,round:roundCounter)
            }else{
                print("wrong")
                wrongLbl.isHidden = false
            }
        }else if(roundCounter==2){
            if(negWords.contains(words[stageCounter])){
                print("correct")
                stageCounter+=1
                stageUp(stageCounter: stageCounter,round:roundCounter)
            }else{
                print("wrong")
                wrongLbl.isHidden = false
            }
        }else if(roundCounter==3){
            if((negWords.contains(words[stageCounter]) && self.wordState==1)||(images[stageCounter].hasPrefix("b") && self.wordState==0)){
                       print("correct")
                       stageCounter+=1
                        let now=Date()
                        t3Times.append(now.timeIntervalSince(start))
                        self.start = Date()
                       stageUp(stageCounter: stageCounter,round:roundCounter)
                   }else{
                       print("wrong")
                       wrongLbl.isHidden = false
                   }
               }
        else if(roundCounter==4){
            let item = combined[stageCounter]
            if(words.contains(item)){
                if(negWords.contains(item)) {
                    print("correct")
                    let now = Date()
                    t4Times.append(now.timeIntervalSince(start))
                    print("appended")
                    start = Date()
                    stageCounter+=1
                    stageUp(stageCounter: stageCounter,round:roundCounter)
                }else{
                    print("wrong")
                    wrongLbl.isHidden = false
                }
            }else{
                if(item.hasPrefix("b")){
                    print("correct")
                    let now = Date()
                    t4Times.append(now.timeIntervalSince(start))
                    print("appended")
                    start = Date()

                    stageCounter+=1
                    stageUp(stageCounter: stageCounter,round:roundCounter)
                }else{
                    print("wrong")
                    wrongLbl.isHidden = false
                }
            }
        }else if(roundCounter==5){
            if(images[stageCounter].hasPrefix("w")){
                print("correct")
                stageCounter+=1
                stageUp(stageCounter:stageCounter,round:roundCounter)
            }else{
                print("wrong")
                wrongLbl.isHidden = false
            }
        }else if(roundCounter==6){
            if((posWords.contains(words[stageCounter]) && self.wordState==1)||(images[stageCounter].hasPrefix("b") && self.wordState==0)){
                print("correct")
                stageCounter+=1
                let now=Date()
                t6Times.append(now.timeIntervalSince(start))
                self.start = Date()
                stageUp(stageCounter: stageCounter,round:roundCounter)
            }else{
                print("wrong")
                wrongLbl.isHidden = false
            }
        }else if(roundCounter==7){
            let item = combined[stageCounter]
            if(words.contains(item)){
                if(posWords.contains(item)) {
                    print("correct")
                    let now = Date()
                    t7Times.append(now.timeIntervalSince(start))
                    start = Date()
                    stageCounter+=1
                    stageUp(stageCounter: stageCounter,round:roundCounter)
                }else{
                    print("b")
                    wrongLbl.isHidden = false
                }
            }else{
                if(item.hasPrefix("b")){
                    print("correct")
                    stageCounter+=1
                    let now = Date()
                    t7Times.append(now.timeIntervalSince(start))
                    print("appended")
                    start = Date()
                    stageUp(stageCounter: stageCounter,round:roundCounter)
                }else{
                    print("wrong")
                    wrongLbl.isHidden = false
                }
            }
        }
    }
    func setImg(img:String){
        wordLbl.isHidden = true
        faceImg.isHidden = false
        faceImg.image = UIImage(named: String("faces/"+img+"_nc.jpg"))
    }
    func setWord(word:String){
        wordLbl.isHidden = false
        faceImg.isHidden = true
        wordLbl.text = word
    }
    func stageUp(stageCounter:Int,round:Int){
        if(round==1 && stageCounter != 11){
            setImg(img: images[stageCounter])
        }else if(round==1 && stageCounter==11){
            proceed(from: 1)
        }else if(round==2 && stageCounter != 11){
            setWord(word: words[stageCounter])
        }else if(round==2 && stageCounter==11){
            proceed(from: 2)
        }else if(round==3 && stageCounter != 10){
            self.wordState = Int.random(in: 0...1)
            if(wordState==0){
                if(imgCount < 12){
                    setImg(img: images[stageCounter])
                    imgCount+=1
                }else{
                    setWord(word: words[stageCounter])
                    wordCount+=1
                }
            }else{
               if(wordCount < 12){
                    setWord(word:words[stageCounter])
                    wordCount+=1
                }else{
                    setImg(img: images[stageCounter])
                    imgCount+=1
                }
            }
        }else if(round==3 && stageCounter==10){
            print(stageCounter)
            proceed(from: 3)
        }else if(round==4 && stageCounter != 20){
            print(stageCounter)
            let newItem = combined[stageCounter]
            if(words.contains(newItem)){
                setWord(word: newItem)
            }else{
                setImg(img: newItem)
            }
        }else if(round==4 && stageCounter==20){
            print(t4Times)
            print(t4Times.count)
            proceed(from: 4)
        }else if(round==5 && stageCounter != 11){
            setImg(img: images[stageCounter])
        }else if(round==5 && stageCounter==11){
            proceed(from: 5)
        }else if(round==6 && stageCounter != 10){
            self.wordState = Int.random(in: 0...1)
            if(wordState==0){
                if(imgCount < 12){
                    setImg(img: images[stageCounter])
                    imgCount+=1
                }else{
                    setWord(word: words[stageCounter])
                    wordCount+=1
                }
            }else{
               if(wordCount < 12){
                    setWord(word:words[stageCounter])
                    wordCount+=1
                }else{
                    setImg(img: images[stageCounter])
                    imgCount+=1
                }
            }
        }else if(round==6 && stageCounter==10){
            print(stageCounter)
            proceed(from: 6)
        }else if(round==7 && stageCounter != 20){
            let newItem = combined[stageCounter]
            if(words.contains(newItem)){
                setWord(word: newItem)
            }else{
                setImg(img: newItem)
            }
        }else if(round==7 && stageCounter==20){
            print(t3Times,t4Times,t6Times,t7Times)
            proceed(from: 7)
        }

        
        
    }
    func proceed(from:Int){
        if(from==1){
            shuffleSets()
            self.roundCounter+=1
            updateLbl()
            self.stageCounter = 0
            setWord(word: words[stageCounter])
            self.btn1.setTitle("Neg", for: .normal)
            self.btn2.setTitle("Pos", for: .normal)
            self.prompt.text = "Press N if the word below seems negative and P if it seems positive"
        }else if(from==2){
            shuffleSets()
            self.roundCounter+=1
            updateLbl()
            self.stageCounter = 0
            self.imgCount = 0
            self.wordCount = 0
            self.btn1.setTitle("N/A", for: .normal)
            self.btn2.setTitle("P/E", for: .normal)
            self.prompt.text = "Press N/A if the word below seems negative or the person seems African-American or P/E if it the word seems positive or if the person seems European-American."
            if(wordState==0){
                setImg(img: images[stageCounter])
                self.imgCount+=1
            }else{
                setWord(word: words[stageCounter])
                self.wordCount+=1
            }
            showAlert(msg: "This section of the test will be timed, press the button below whenever you're ready. Make sure you read the instructions above before pressing the button.", btnMsg: "Start the timer!")
        }else if(from==3){
            shuffleSets()
            self.roundCounter+=1
            updateLbl()
            self.stageCounter = 0
            let item = combined[stageCounter]
            if(words.contains(item)){
                setWord(word: item)
            }else{
                setImg(img: item)
            }
            showAlert(msg: "This section of the test will also be timed, press the button below whenever you're ready", btnMsg: "Start the timer!")
        }else if(from==4){
            shuffleSets()
            print(t4Times)
            self.roundCounter+=1
            updateLbl()
            self.btn1.setTitle("E", for: .normal)
            self.btn2.setTitle("A", for: .normal)
            self.prompt.text = "Press A if the person seems African-American or E if they seem European-American"
            showAlert(msg: "In the next section, you'll have to classify faces in the same manner as the first section, but with one catch: the position of the buttons will be changed. Be careful. This section will not be timed.", btnMsg: "Okay, understood.")
            stageCounter = 0
            setImg(img: images[stageCounter])
        }else if(from==5){
            shuffleSets()
            self.roundCounter+=1
            updateLbl()
            self.stageCounter = 0
            self.imgCount = 0
            self.wordCount = 0
            self.btn1.setTitle("P/A", for: .normal)
            self.btn2.setTitle("N/E", for: .normal)
            self.prompt.text = "Press P/A if the word below seems positive or if the person seems African-American and N/E if  the word seems negative or the person seems European-American"
            if(wordState==0){
                setImg(img: images[stageCounter])
                self.imgCount+=1
            }else{
                setWord(word: words[stageCounter])
                self.wordCount+=1
            }
            showAlert(msg: "In the next section, you'll have to classify faces and words in the same manner as the 3rd section. But, be careful and read the instructions above before pressing the button. This section will be timed.", btnMsg: "Okay, understood.")
        }else if(from==6){
            shuffleSets()
            self.roundCounter+=1
            updateLbl()
            self.stageCounter = 0
            self.imgCount=0
            self.wordCount=0
            if(wordState==0){
                setImg(img: images[stageCounter])
                self.imgCount+=1
            }else{
                setWord(word: words[stageCounter])
                self.wordCount+=1
            }
            showAlert(msg: "The last section will be the same as before and also be timed.", btnMsg: "Okay, understood.")
        }else if(from==7){
            print("finished")
            print(t3Times.count,t4Times.count,t6Times.count,t7Times.count)
            res = calc(t3: t3Times, t4: t4Times, t6: t6Times, t7: t7Times)
            self.performSegue(withIdentifier: "results", sender: nil)
        }
    }
    func showAlert(msg:String,btnMsg:String){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: btnMsg, style: UIAlertAction.Style.default, handler: { action in
            self.start = Date()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func shuffleSets(){
        images = images.shuffled()
        words = words.shuffled()
    }
    func updateLbl(){
        self.stageLbl.text = String(self.roundCounter)
    }
}
