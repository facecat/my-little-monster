//
//  MonsterImageView.swift
//  my-little-monster
//
//  Created by 邱国邦 on 15/12/15.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import Foundation
import UIKit

class MonsterImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    //MARK: Property
    enum monsterStyle {
        case bigHeadMonster
        case smallHeadMonster
    }

    var monsterChosen = monsterStyle.smallHeadMonster
    
    //MARK: Function
    
    func bigHeadMonsterChosen() {
        monsterChosen = monsterStyle.bigHeadMonster

        startImgAnimate()
    }
    
    func smallHeadMonsterChosen() {
        monsterChosen = monsterStyle.smallHeadMonster

        startImgAnimate()
    }
    
    //Animation
    func startImgAnimate() {
        var images = [UIImage]()

        if monsterChosen == monsterStyle.smallHeadMonster {
            self.image = UIImage(named: "idle1")
            
            for i in 1...4 {
                let img = UIImage(named: "idle\(i)")
                images.append(img!)
            }
        } else if monsterChosen == monsterStyle.bigHeadMonster {
            self.image = UIImage(named: "idle (1)")
            
            for i in 1...4 {
                let img = UIImage(named: "idle (\(i))")
                images.append(img!)
            }
        }

        self.animationImages = images
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func startDeathAnimate() {
        var images = [UIImage]()

        if monsterChosen == monsterStyle.smallHeadMonster {
            
            self.image = UIImage(named: "dead5")
            
            for i in 1...5 {
                let img = UIImage(named: "dead\(i)")
                images.append(img!)
            }
        } else if monsterChosen == monsterStyle.bigHeadMonster {
            
            self.image = UIImage(named: "dead (5)")
            
            for i in 1...5 {
                let img = UIImage(named: "dead (\(i))")
                images.append(img!)
            }
        }
        
        self.animationImages = images
        self.animationDuration = 1.0
        self.animationRepeatCount = 1
        self.startAnimating()
    }
    
    
    
    
    
    
}