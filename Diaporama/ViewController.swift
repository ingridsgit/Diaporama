//
//  ViewController.swift
//  Diaporama
//
//  Created by Admin on 23/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image_view: UIImageView!
    @IBOutlet weak var label: UILabel!
    var i = 0
    var timer:Timer? = nil
    
    let imagesArray = ["france", "europe", "monde", "amerique-nord", "amerique-sud", "asie", "oceanie", "afrique"]
    let namesArray = ["France", "Europe", "Monde", "Amérique du Nord", "Amérique du Sud", "Asie", "Océanie", "Afrique"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setDiapo(imageIndex: i)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUpTimer()
    }
    
    func setDiapo(imageIndex i:Int){
        image_view.image = UIImage.init(named: imagesArray[i])
        label.text = namesArray[i]
    }
    
    func incrementI(){
        if self.i < self.imagesArray.count - 1{
            self.i = self.i + 1
        } else {
            self.i = 0
        }
    }
    
    @IBAction func onPreviousClicked(_ sender: Any) {
        invalidateDiapo()
        if self.i == 0 {
            self.i = imagesArray.count - 1
        } else {
            self.i = i - 1
        }
        setDiapo(imageIndex: self.i)
        self.setUpTimer()
    }
    
    @IBAction func onNextClicked(_ sender: Any) {
        invalidateDiapo()
        self.incrementI()
        self.setDiapo(imageIndex: self.i)
        self.setUpTimer()
        
    }
    
    func setUpTimer(){
        timer = Timer.scheduledTimer(withTimeInterval: UserData.displayDuration, repeats: true) { (_) in
            self.incrementI()
            self.setDiapo(imageIndex: self.i)
        }
    }
    
    func invalidateDiapo(){
        if let timer = timer {
            timer.invalidate()
            self.timer = nil
        }
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        invalidateDiapo()
        timer = nil
    }


}

