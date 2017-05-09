//
//  ViewController.swift
//  MagicalGrid
//
//  Created by Stef on 5/9/17.
//  Copyright © 2017 Stef. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let numViewPerRow = 15
        let screenWidh = view.frame.width
        let viewWidth = screenWidh / CGFloat(numViewPerRow)
        let numViewPerColumn = view.frame.height / viewWidth
        
        for j in 0...Int(numViewPerColumn) {
            for i in 0...numViewPerRow {
                let squareView = UIView()
                squareView.backgroundColor = randomColor()
                squareView.layer.borderColor = UIColor.black.cgColor
                squareView.layer.borderWidth = 1.0
                squareView.frame = CGRect(x: CGFloat(i) * viewWidth, y: CGFloat(j) * viewWidth, width: viewWidth, height: viewWidth)
                view.addSubview(squareView)
            }
        }
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    func handlePan(pan: UIPanGestureRecognizer) {
        print("handled pan")
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

fileprivate func randomColor() -> UIColor {
    let red = 1 + drand48() * 255
    let green = 1 + drand48() * 255
    let blue = 1 + drand48() * 255
    let resultColor = UIColor(colorLiteralRed: Float(red/255.0), green: Float(green/255), blue: Float(blue/255), alpha: 1.0)
    
    return resultColor
}
