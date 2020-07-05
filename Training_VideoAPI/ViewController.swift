//
//  ViewController.swift
//  Training_VideoAPI
//
//  Created by mmslab-mini on 2020/6/26.
//  Copyright © 2020 mmslab-mini. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation


class ViewController: UIViewController {
    @IBOutlet var VideoView: UIView!
    @IBOutlet var PlayPauseBtn: UIButton!
    @IBOutlet var ScriptTable: UITableView!
    
    var avPlayer : AVPlayer!
    var playState : Bool!
    var playerItem : AVPlayerItem! = nil
    let avPlayerController = AVPlayerViewController()
    var VideoIsPlaying = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScriptTable.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
        VideoSetup()

    }
    
    func VideoSetup() {
        let filePath = Bundle.main.path(forResource: "Video", ofType: "mp4")
        let fileURL = URL.init(fileURLWithPath: filePath!)
        
        avPlayer = AVPlayer(url: fileURL)
        
        avPlayerController.player = avPlayer
        avPlayerController.view.frame = CGRect(x: 0, y: 0, width: VideoView.frame.width, height: VideoView.frame.height)
        avPlayerController.showsPlaybackControls = false
        
        VideoView.addSubview(avPlayerController.view)
    }
// Bugged
    @IBAction func BtnClicked(_ sender: Any) {
        if(VideoIsPlaying == false) {
            PlayPauseBtn.setImage(UIImage(named: "pause.png"), for: UIControl.State.normal)
            avPlayerController.player?.play()
            VideoIsPlaying = true
        }
        else {
            PlayPauseBtn.setImage(UIImage(named: "play.png"), for: UIControl.State.normal)
            avPlayerController.player?.pause()
            VideoIsPlaying = false
        }
        
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ScriptTable.dequeueReusableCell(withIdentifier: "reuseCell", for: indexPath)
        return cell
    }
    
    
}
