//
//  ViewController.swift
//  wantube
//
//  Created by Yongwan on 26/07/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    
    var videos: [Video] = {
        var tmpVideo = Video()
        tmpVideo.title = "ChainSmokers - SickBoy"
        tmpVideo.subTitle = "OfficalChainSmokers - 1.000.000.000 views - 2 years "
        tmpVideo.thumbnailImageName = "Default_Thumb"
        
        var tmpChannel = Channel()
        tmpChannel.name = "ChainSmokers"
        tmpChannel.profileImageName = "Default_Profile"
        
        tmpVideo.channel = tmpChannel
        return [tmpVideo]
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let titleView = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 32, height: (self.navigationController?.navigationBar.frame.height)!))
        
        titleView.textAlignment = .left
        titleView.textColor = .white
        titleView.font = .boldSystemFont(ofSize: 20)
        titleView.text = "WanTube"
        self.navigationItem.titleView = titleView
        
        
        self.tableView.register(VideoCell.self, forCellReuseIdentifier: "cellId")
        self.navigationController?.navigationBar.barTintColor = .red
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.videos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! VideoCell
        let tmpVideo = self.videos[indexPath.row]
        cell.titleLabel.text = tmpVideo.title
        cell.subTitleLabel.text = tmpVideo.subTitle
        if let thumbnailImageName = tmpVideo.thumbnailImageName{
            cell.thumbnailImageView.image = UIImage(named: thumbnailImageName)
        }
        if let profileImageName = tmpVideo.channel?.profileImageName{
                cell.profileImageView.image = UIImage(named: profileImageName)
        }
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
