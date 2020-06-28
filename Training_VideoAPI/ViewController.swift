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

    let player = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileUrl = Bundle.main.url(forResource: "Video", withExtension: "mp4")!
        let playerItem = AVPlayerItem(url: fileUrl)
        player.replaceCurrentItem(with: playerItem)
        player.play()        
    }


}

