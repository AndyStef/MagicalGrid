//
//  ViewController.swift
//  MagicalGrid
//
//  Created by Stef on 5/9/17.
//  Copyright © 2017 Stef. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let numViewPerRow = 15
    var cells = [String: UIView]()
    var selectedView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
                
                let key = "\(i)|\(j)"
                cells[key] = squareView
            }
        }
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        view.addGestureRecognizer(panGesture)
    }
    
    func handlePan(pan: UIPanGestureRecognizer) {
        //MARK: - Solution that uses hash map and much more effective
        let location = pan.location(in: view)
        let viewWidth = view.frame.width / CGFloat(numViewPerRow)
        let i = Int(location.x / viewWidth)
        let j = Int(location.y / viewWidth)
        let key = "\(i)|\(j)"
        guard let cellView = cells[key] else { return }
        
        if selectedView != cellView {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
                self.selectedView?.layer.transform = CATransform3DIdentity
            }, completion: nil)
        }
        
        selectedView = cellView
        view.bringSubview(toFront: cellView)
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            cellView.layer.transform = CATransform3DMakeScale(6, 6, 6)
        }, completion: nil)
        
        
        if pan.state == .ended {
            UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                cellView.layer.transform = CATransform3DIdentity
            }, completion: nil)
        }
        
        //MARK: - bad solution because of huge number of iterations
//        for subview in view.subviews {
//            if subview.frame.contains(location) {
//                let transform = CGAffineTransform(scaleX: 2.5, y: 2.5)
//                view.bringSubview(toFront: subview)
//                UIView.animate(withDuration: 0.2, animations: {
//                    subview.transform = transform
//                })
//            }
//        }
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
