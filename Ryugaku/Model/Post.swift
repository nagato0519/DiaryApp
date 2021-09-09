//
//  Post.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/29/21.
//

import SwiftUI
import Firebase

class Post: Identifiable{
    let id: String
    var caption: String
    let picURL: String
    let timeStamp: Timestamp
    let relax: Bool
    let study: Bool
    let play: Bool
    let shopping: Bool
    let exercise: Bool
    
    
    init(dictionary: [String: Any]){
        self.id = dictionary["id"] as? String ?? ""
        self.caption = dictionary["caption"] as? String ?? ""
        self.picURL = dictionary["picURL"] as? String ?? ""
        self.timeStamp = dictionary["timeStamp"] as? Timestamp ?? Timestamp(date: Date())
        self.relax = dictionary["relax"] as? Bool ?? false
        self.study = dictionary["study"] as? Bool ?? false
        self.play = dictionary["play"] as? Bool ?? false
        self.shopping = dictionary["shopping"] as? Bool ?? false
        self.exercise = dictionary["exercise"] as? Bool ?? false
    }
    
    var dateString: String{
        let format = DateFormatter()
        format.dateFormat = "M/d/yyyy"
        return format.string(from: timeStamp.dateValue())
    }
}

