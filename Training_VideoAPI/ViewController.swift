//
//  ViewController.swift
//  Training_VideoAPI
//
//  Created by mmslab-mini on 2020/6/26.
//  Copyright © 2020 mmslab-mini. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    @IBOutlet var VideoView: UIView!
    @IBOutlet var PlayPauseBtn: UIButton!
    @IBOutlet var ScriptTable: UITableView!
    
    
    let fileUrl = Bundle.main.url(forResource: "Video", withExtension: "mp4")!
    var player : AVPlayer!
    var playState : Bool!
    var playerItem : AVPlayerItem! = nil
//    var player : AVPlayer?
//
//    private lazy var layer : AVPlayerLayer = {
//        let fileUrl = Bundle.main.url(forResource: "Video", withExtension: "mp4")!
//        self.player = AVPlayer(url: fileUrl)
//        let layer = AVPlayerLayer(player: self.player)
//        return layer
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        playVideo()
        print("123")
//        view.layer.addSublayer(self.layer)
//        player.replaceCurrentItem(with: playerItem)
//        player?.play()
    }
//    func playVideo() {
//        var playerItem = AVPlayerItem(url: fileUrl)
//        var player = AVPlayer(playerItem: playerItem)
//        let playerLayer = AVPlayerLayer(player: player)
////        playerLayer.frame =
//        view.layer.addSublayer(playerLayer)
//        player.play()
//    }
    func AVPlayerSetting() {
    if player == nil {
        playerItem = AVPlayerItem(url: fileUrl)
        player = AVPlayer(playerItem: playerItem)
        let playerLayer:AVPlayerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = VideoView.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspect
        VideoView.layer.addSublayer(playerLayer)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
//        NotificationCenter.defaultCenter().addObserver(self,
//        selector: #selector(playerEnd),
//        name: AVPlayerItemDidPlayToEndTimeNotification,
//        object: playerItem)
//        addSomeObserver()
        playState = true
        }
    }
}
