//
//  ViewController.swift
//  wantube
//
//  Created by Yongwan on 26/07/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {
    

    var videos = [Video]()
    var thumbnailImages = [UIImage?](repeating: nil, count: 10)
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchVideos()
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
    
    func fetchVideos(){
        
        guard let VideoUrl = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json") else{
            print("ERROR : url optional can't remove")
            return
        }
        do{
            guard let jsonData = try String(contentsOf: VideoUrl).data(using: .utf8) else{
                print("ERROR : string -> jsonData :Data")
                return
            }
            let a = try String(contentsOf: VideoUrl)
            self.videos = try JSONDecoder().decode([Video].self, from: jsonData)
            
            print("good")
        }catch let error as NSError{
            print("error : "+error.localizedDescription)
        }
    }
    func getThumbnailImage(imageUrlString: String, indexPath: IndexPath) -> UIImage?{
        if let thumbnailImage = thumbnailImages[indexPath.row]{
            return thumbnailImage
        }else{
            if let thumbnailImgUrl = URL(string: imageUrlString){
                print("?")
                do{
                    let data = try Data(contentsOf: thumbnailImgUrl)
                    self.thumbnailImages[indexPath.row] = UIImage(data: data)
                    return thumbnailImages[indexPath.row]
                }catch let error as NSError{
                    print("ERROR : image 가져오기")
                    
                    return nil
                }
            }else{
                return nil
            }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.videos.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId") as! VideoCell
        let tmpVideo = self.videos[indexPath.row]
        cell.titleLabel.text = tmpVideo.title
        cell.subTitleLabel.text = String(tmpVideo.numberOfViews)
        
        DispatchQueue.main.async {
            cell.thumbnailImageView.image = self.getThumbnailImage(imageUrlString: tmpVideo.thumbnailImageName, indexPath: indexPath)
        }
        //cell.profileImageView.image = UIImage(named: tmpVideo.channel.profileImageName)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let videoLauncher = VideoLauncher()
        videoLauncher.LaunchVideo()
    }
}

