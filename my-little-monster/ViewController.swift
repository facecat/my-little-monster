//
//  ViewController.swift
//  my-little-monster
//
//  Created by 邱国邦 on 15/12/15.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monsterImg: MonsterImageView!
    @IBOutlet weak var heartImg: DragImageView!
    @IBOutlet weak var foodImg: DragImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

