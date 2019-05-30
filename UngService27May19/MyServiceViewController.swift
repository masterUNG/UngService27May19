//
//  MyServiceViewController.swift
//  UngService27May19
//
//  Created by MasterUNG on 30/5/2562 BE.
//  Copyright © 2562 MasterUNG. All rights reserved.
//

import UIKit
import AVFoundation

class MyServiceViewController: UIViewController {
    
    var myPlayer: AVPlayer?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }   // Main Method
    
    
    
    @IBAction func stopButton(_ sender: UIButton) {
        myPlayer?.pause()
    }
    
    
    @IBAction func playButton(_ sender: UIButton) {
        
        let urlMP3: String = "https://febcthailand.com/m/mp3/answer/r.mp3"
        let url = URL.init(string: urlMP3)
        
        let playerItem: AVPlayerItem = AVPlayerItem(url: url!)
        myPlayer = AVPlayer(playerItem: playerItem)
        let playerLayer: AVPlayerLayer = AVPlayerLayer(player: myPlayer)
        
        playerLayer.frame = CGRect(x: 0, y: 0, width: 10, height: 50)
        self.view.layer.addSublayer(playerLayer)
        myPlayer!.play()
        
    }   // playButton
    
  

}   // Main Class
