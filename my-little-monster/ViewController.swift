//
//  ViewController.swift
//  my-little-monster
//
//  Created by 邱国邦 on 15/12/15.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: Outlet
    @IBOutlet weak var monsterImg: MonsterImageView!
    @IBOutlet weak var heartImg: DragImageView!
    @IBOutlet weak var foodImg: DragImageView!
    @IBOutlet weak var skullImg1: UIImageView!
    @IBOutlet weak var skullImg2: UIImageView!
    @IBOutlet weak var skullImg3: UIImageView!
    
    //MARK: Constant
    let OPAQUE: CGFloat = 1.0
    let MID_ALPHA: CGFloat = 0.2
    let MAX_PENALTY: Int = 3
    
    //MARK: Property
    var penaltyNum: Int = 0
    var timer: NSTimer!
    var isMonsterHappy = true
    var currentItem: UInt32 = 0
    var musicPlayer: AVAudioPlayer!
    var sfxDead: AVAudioPlayer!
    var sfxBite: AVAudioPlayer!
    var sfxSkull: AVAudioPlayer!
    var sfxHeart: AVAudioPlayer!
    
    //MARK: Don't know u
    override func viewDidLoad() {
        super.viewDidLoad()
        
        skullImg1.alpha = MID_ALPHA
        skullImg2.alpha = MID_ALPHA
        skullImg3.alpha = MID_ALPHA
        setupSound()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "dropItemOnMonster:", name: "onTargetDropped", object: nil)
        
        heartImg.dropTarget = monsterImg
        foodImg.dropTarget = monsterImg
        
        startTimer()
    }
    
    //MARK: function
    func setupSound() {
        //background music
        do {
            try musicPlayer = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("cave-music", ofType: "mp3")!))

            musicPlayer.prepareToPlay()
            musicPlayer.play()

            try sfxBite = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bite", ofType: "wav")!))
            try sfxDead = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("death", ofType: "wav")!))
            try sfxHeart = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("heart", ofType: "wav")!))
            try sfxSkull = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("skull", ofType: "wav")!))
           
            sfxBite.prepareToPlay()
            sfxDead.prepareToPlay()
            sfxHeart.prepareToPlay()
            sfxSkull.prepareToPlay()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    func startTimer() {
        if timer != nil { timer.invalidate() }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "changeGameState", userInfo: nil, repeats: true)
        timer.fire()
    }
    
    func dropItemOnMonster(notif: AnyObject?) {
        print("drop on me!")
        isMonsterHappy = true
        
        if currentItem == 0 {
            sfxBite.play()
            
            foodImg.alpha = MID_ALPHA
            foodImg.userInteractionEnabled = false
        } else if currentItem == 1 {
            sfxHeart.play()
            
            heartImg.alpha = MID_ALPHA
            heartImg.userInteractionEnabled = false
        }
    }
    
    func gameOver() {
        timer.invalidate()
        monsterImg.startDeathAnimate()
        sfxDead.play()
        
        foodImg.alpha = MID_ALPHA
        foodImg.userInteractionEnabled = false
        heartImg.alpha = MID_ALPHA
        heartImg.userInteractionEnabled = false
    }
    
    func chooseRandomItem() {
        let randomNum = arc4random_uniform(2)
        
        if randomNum == 0 {
            foodImg.alpha = OPAQUE
            foodImg.userInteractionEnabled = true
            
            heartImg.alpha = MID_ALPHA
            heartImg.userInteractionEnabled = false
        } else {
            heartImg.alpha = OPAQUE
            heartImg.userInteractionEnabled = true
            
            foodImg.alpha = MID_ALPHA
            foodImg.userInteractionEnabled = false
        }
        
        currentItem = randomNum
    }
    
    func changeGameState() {
        
        chooseRandomItem()
        
        if !isMonsterHappy {
            penaltyNum++

            switch penaltyNum {
                
            case 1 :
                skullImg1.alpha = OPAQUE
                
            case 2 :
                skullImg2.alpha = OPAQUE
                
            case 3 :
                skullImg3.alpha = OPAQUE
                
            default :
                skullImg1.alpha = MID_ALPHA
                skullImg2.alpha = MID_ALPHA
                skullImg3.alpha = MID_ALPHA
            }
            
            if penaltyNum == 3 {
                gameOver()
            }

            sfxSkull.play()
            //        print(penaltyNum)
        }
        
        isMonsterHappy = false
    }
    
    
    

}

