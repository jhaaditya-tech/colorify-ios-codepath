//
//  ViewController.swift
//  Colorify
//
//  Created by Aditya Jha on 12/18/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    var audioPlayer: AVAudioPlayer!
    
    func changeColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func randomTextColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

    @IBOutlet weak var label1: UILabel!
    
    @IBOutlet weak var label2: UILabel!
    
    
    @IBOutlet weak var label3: UILabel!

    
    @IBOutlet weak var textBackgroundView: UIImageView!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        if gradientLayer == nil{
            setGradientBackground()
        }
        
        UIView.animate(withDuration: 0.5){
            let randomColor1 = self.changeColor()
            let randomColor2 = self.changeColor()
            
            //self.view.backgroundColor = randomColor
            self.gradientLayer?.colors = [randomColor1.cgColor, randomColor2.cgColor]
            
            self.label1.textColor = self.randomTextColor()
            self.label2.textColor = self.randomTextColor()
            self.label3.textColor = self.randomTextColor()
            
            self.imageView.backgroundColor = randomColor1
            
        }
        
    }
    
    
    @IBAction func resetToDefault(_ sender: UIButton) {
        // Remove the gradient layer if it exists
        gradientLayer?.removeFromSuperlayer()
        gradientLayer = nil
        view.backgroundColor = .white
        label1.textColor = .black
        label2.textColor = .black
        label3.textColor = .black
        imageView.backgroundColor = .clear
        
    }
    
    var gradientLayer: CAGradientLayer?
    
    
    func setGradientBackground() {

        gradientLayer = CAGradientLayer()
        gradientLayer?.frame = view.bounds
        gradientLayer?.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradientLayer?.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer?.endPoint = CGPoint(x: 1, y: 1)
        
        if let gradient = gradientLayer {
            view.layer.insertSublayer(gradient, at: 0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setGradientBackground()
        textBackgroundView.backgroundColor = .white
    }
    
}

