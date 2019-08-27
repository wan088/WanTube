//
//  VideoLauncher.swift
//  wantube
//
//  Created by Yongwan on 05/08/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import Foundation
import UIKit
import AVKit
class VideoPlayerView: UIView{
    let controlsContainerView: UIView = {
        let ccv = UIView();
        ccv.backgroundColor = UIColor(white: 0, alpha: 0.5)
        return ccv
    }()
    let activityIndicator :UIActivityIndicatorView = {
        let aiv = UIActivityIndicatorView()
        aiv.translatesAutoresizingMaskIntoConstraints = false
        aiv.startAnimating()
        return aiv
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpPlayerView()

        self.controlsContainerView.frame = frame
        self.addSubview(controlsContainerView)
        
        self.controlsContainerView.addSubview(self.activityIndicator)
        
        self.activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
    }
    func setUpPlayerView(){
        self.backgroundColor = .black
        
        let urlString = "https://firebasestorage.googleapis.com/v0/b/gameofchats-762ca.appspot.com/o/message_movies%2F12323439-9729-4941-BA07-2BAE970967C7.mov?alt=media&token=3e37a093-3bc8-410f-84d3-38332af9c726"
        if let url = URL(string: urlString){
            let player = AVPlayer(url: url)
            let playerlayer = AVPlayerLayer(player: player)
            playerlayer.frame = self.frame
            self.layer.addSublayer(playerlayer)
            player.play()
            player.addObserver(self, forKeyPath: "currentTime.loadedTimeRanges", options: .new, context: nil)
        }
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "currentTime.loadedTimeRanges" {
            print("받음")
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class VideoLauncher{
    init() {
        print("selected")
    }
    
    func LaunchVideo(){
        if let keyWindow = UIApplication.shared.keyWindow{
            let videoView = UIView(frame: CGRect(x: keyWindow.frame.width-10, y: keyWindow.frame.height-10, width: 10, height: 10))
            videoView.backgroundColor = .white
            keyWindow.addSubview(videoView)
            
            
            let vpv_frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: keyWindow.frame.width*9/16)
            let videoPlayer = VideoPlayerView(frame: vpv_frame)
            videoView.addSubview(videoPlayer)
            
            //let gr = UIGestureRecognizer(target: self, action: #selector(toMini(_:)))
            let gr = UITapGestureRecognizer(target: self, action: #selector(toMini(_:)))
            videoView.addGestureRecognizer(gr)
            
            UIView.animate(withDuration: 0.3, animations:{
                videoView.frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: keyWindow.frame.height)
            }){(_) in
                UIApplication.shared.isStatusBarHidden = true
            }
        }
    }
    @objc
    func toMini(_ sender: Any){
        print("옵")
    }
}
