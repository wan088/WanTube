//
//  ViewController.swift
//  wantube
//
//  Created by Yongwan on 26/07/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationItem.title = "Home"
        self.tableView.register(VideoCell.self, forCellReuseIdentifier: "cellId")
        print(VideoCell.self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellId")!
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(200)
    }
}
class VideoCell: UITableViewCell{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    var thumbnailImageView: UIImageView = {
        let imageView :UIImageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    func setupViews(){
        self.addSubview(thumbnailImageView)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : thumbnailImageView]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-16-[v0]-16-|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0" : thumbnailImageView]))
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
