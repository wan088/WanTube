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
        
        let titleView = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width - 32, height: self.view.frame.height))
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
        return 5
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellId")!
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
