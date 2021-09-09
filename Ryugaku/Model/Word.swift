//
//  Word.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/6/21.
//

import SwiftUI
import Firebase

class Word: Identifiable{
    let id: String
    let English: String
    let Japanese: String
    let Liked: Bool
    let timeStamp: Timestamp
    
    
    init(dictionary: [String: Any]){
        self.id = dictionary["id"] as? String ?? ""
        self.English = dictionary["English"] as? String ?? ""
        self.Japanese = dictionary["Japanese"] as? String ?? ""
        self.Liked = dictionary["liked"] as? Bool ?? false
        self.timeStamp = dictionary["timeStamp"] as? Timestamp ?? Timestamp(date: Date())
        
    }
    
//
//    var dateString: String{
//        let format = DateFormatter()
//        format.dateFormat = "MMM d, yyyy"
//        return format.string(from: timeStamp.dateValue())
//    }
}
