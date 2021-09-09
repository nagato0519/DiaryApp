//
//  User.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/29/21.
//

import SwiftUI
import Firebase
import FirebaseAuth

class User: Identifiable{
    let uid: String
    
    init(dictionary: [String: Any]){
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
