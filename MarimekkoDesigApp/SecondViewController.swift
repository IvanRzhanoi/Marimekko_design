//
//  SecondViewController.swift
//  MarimekkoDesigApp
//
//  Created by Ivan Rzhanoi on 16/09/2017.
//  Copyright © 2017 Ivan Rzhanoi. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet weak var topVideoView: UIView!
    @IBOutlet weak var bottomVideoView: UIView!
    
    var avPlayer: AVPlayer!
    var avPlayerLayer: AVPlayerLayer!
    var paused: Bool = false
    
    var avPlayer2: AVPlayer!
    var avPlayerLayer2: AVPlayerLayer!
    var paused2: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startTopPlayback()
        startBottomPlayback()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        avPlayerLayer.frame = topVideoView.layer.bounds
        avPlayerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        topVideoView.layer.insertSublayer(avPlayerLayer, at: 0)
        
        avPlayer.play()
        paused = false
        
        avPlayerLayer2.frame = bottomVideoView.layer.bounds
        avPlayerLayer2.videoGravity = AVLayerVideoGravity.resizeAspectFill
        bottomVideoView.layer.insertSublayer(avPlayerLayer2, at: 0)

        avPlayer2.play()
        paused2 = false
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        avPlayer.pause()
        paused = true
        
        avPlayer2.pause()
        paused2 = true
    }
    
    func startTopPlayback() {
        let theURL = Bundle.main.url(forResource: "IMG_0064", withExtension: "mp4")
        
        avPlayer = AVPlayer(url: theURL!)
        avPlayerLayer = AVPlayerLayer(player: avPlayer)
        
        avPlayer.volume = 0
        avPlayer.actionAtItemEnd = .none
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: avPlayer.currentItem)
    }
    
    func startBottomPlayback() {
        let theURL = Bundle.main.url(forResource: "IMG_0064_1", withExtension: "mp4")

        avPlayer2 = AVPlayer(url: theURL!)
        avPlayerLayer2 = AVPlayerLayer(player: avPlayer2)

        avPlayer2.volume = 0
        avPlayer2.actionAtItemEnd = .none

        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
                                               object: avPlayer2.currentItem)
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        let p: AVPlayerItem = notification.object as! AVPlayerItem
        p.seek(to: kCMTimeZero)
    }
}

