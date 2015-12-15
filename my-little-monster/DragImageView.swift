//
//  DragImageView.swift
//  my-little-monster
//
//  Created by 邱国邦 on 15/12/16.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import Foundation
import UIKit

class DragImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    
    }
    
    
    //MARK: Touch events
    
    var originPosition: CGPoint!
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
            originPosition = CGPointMake(self.center.x, self.center.y)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            
            let location = touch.locationInView(self.superview)
            self.center = location
        }

    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.center = originPosition
    }
    
    
}