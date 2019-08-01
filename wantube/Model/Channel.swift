//
//  Channel.swift
//  wantube
//
//  Created by Yongwan on 28/07/2019.
//  Copyright © 2019 Yongwan. All rights reserved.
//

import UIKit
//class Channel{
//    var name: String?
//    var profileImageName: String?
//}
// MARK: - Channel
class Channel: Codable {
    let name: String
    let profileImageName: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case profileImageName = "profile_image_name"
    }
    
    init(name: String, profileImageName: String) {
        self.name = name
        self.profileImageName = profileImageName
    }
}
