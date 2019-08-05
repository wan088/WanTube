//
//  Video.swift
//  wantube
//
//  Created by Yongwan on 28/07/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit

//class Video{
//    var thumbnailImageName: String?
//    var title: String?
//    var subTitle: String?
//
//    var channel: Channel?
//}


// MARK: - Video
class Video: Codable {
    let title: String
    let numberOfViews: Int
    let thumbnailImageName: String
    let channel: Channel
    let duration: Int
    
    
    enum CodingKeys: String, CodingKey {
        case title
        case numberOfViews = "number_of_views"
        case thumbnailImageName = "thumbnail_image_name"
        case channel, duration
    }
    
    init(title: String, numberOfViews: Int, thumbnailImageName: String, channel: Channel, duration: Int) {
        self.title = title
        self.numberOfViews = numberOfViews
        self.thumbnailImageName = thumbnailImageName
        self.channel = channel
        self.duration = duration
    }
}

