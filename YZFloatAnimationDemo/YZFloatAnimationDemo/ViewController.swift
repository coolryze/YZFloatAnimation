//
//  ViewController.swift
//  YZFloatAnimationDemo
//
//  Created by heyuze on 2017/5/22.
//  Copyright © 2017年 heyuze. All rights reserved.
//

import UIKit

let kScreenBounds = UIScreen.main.bounds
let kScreenWidth = kScreenBounds.width
let kScreenHeight = kScreenBounds.height

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - TouchedBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let randomNumber = Int(arc4random_uniform(10)+1)
        let image = UIImage(named: "float_\(randomNumber)")!
        let floatAnimationView = YZFloatAnimationView(image: image)
        self.view.insertSubview(floatAnimationView, at: 0)
        let centerPoint = CGPoint(x: kScreenWidth - 40, y: kScreenHeight - 40)
        floatAnimationView.center = centerPoint
        floatAnimationView.animating(in: self.view)
    }

}

