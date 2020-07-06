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
/* API datas */
struct VideoScript: Codable {
    var result: result
}
struct result: Codable {
    var videoInfo: videoInfo
}
struct videoInfo: Codable {
    var captionResult: captionResult
}
struct captionResult: Codable {
    var results: [results]
}
struct results: Codable {
    var captions: [captions]
}
struct captions: Codable {
    var time: CLong         // seconds
    var content: String
}

class DataModel: Codable {
    let guestKey = "44f6cfed-b251-4952-b6ab-34de1a599ae4"
    let videoID = "5edfb3b04486bc1b20c2851a"
    let mode = 1
}

class ViewController: UIViewController {
    
    @IBOutlet var VideoView: UIView!
    @IBOutlet var PlayPauseBtn: UIButton!
    @IBOutlet var ScriptTable: UITableView!
    /* Video settings */
    var avPlayer : AVPlayer!
    let avPlayerController = AVPlayerViewController()
    var VideoIsPlaying = false
    
    let VideoURL = "https://api.italkutalk.com/api/video/detail"
    var ScriptData : VideoScript?
    var Scripts = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromAPI()
        ScriptTable.register(UITableViewCell.self, forCellReuseIdentifier: "reuseCell")
        VideoSetup()
        TableViewCellInit()
    }
    /* Setting up video player environments */
    func VideoSetup() {
        let filePath = Bundle.main.path(forResource: "Video", ofType: "mp4")
        let fileURL = URL.init(fileURLWithPath: filePath!)
        avPlayer = AVPlayer(url: fileURL)
        avPlayerController.player = avPlayer
        avPlayerController.view.frame = CGRect(x: 0, y: 0, width: VideoView.frame.width, height: VideoView.frame.height)
        avPlayerController.showsPlaybackControls = false
        VideoView.addSubview(avPlayerController.view)
    }
    /* Initializing TableViewCells */
    func TableViewCellInit() {
        let cellNib = UINib(nibName: "ScriptTableTableViewCell", bundle: nil)
        ScriptTable.register(cellNib, forCellReuseIdentifier: "ScriptTableTableViewCell")
        ScriptTable.rowHeight = 65
        ScriptTable.estimatedRowHeight = 0
    }
    /* Decode API datas and reload tableview */
    func getDataFromAPI() {
        let Datas = DataModel()
        let encodedDatas = try? JSONEncoder().encode(Datas)
        let url = URL(string: VideoURL)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = encodedDatas
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request){ data, response,error in DispatchQueue.main.async {
            do {
                self.ScriptData = try JSONDecoder().decode(VideoScript.self, from: data!)
                self.ScriptTable.reloadData()
                }
            catch {
                print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    
    /* Button image clicked and reactions */
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        return ScriptData?.result.videoInfo.captionResult.results[0].captions.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ScriptTable.dequeueReusableCell(withIdentifier: "ScriptTableTableViewCell", for: indexPath) as! ScriptTableTableViewCell
        let script = ScriptData?.result.videoInfo.captionResult.results[0].captions[indexPath.row].content ?? ""
        let times = ScriptData?.result.videoInfo.captionResult.results[0].captions[indexPath.row].time ?? 0
        cell.setCell(Scripts: script, No: indexPath.row+1, Time: times)
        
        return cell
    }
    
    
}
