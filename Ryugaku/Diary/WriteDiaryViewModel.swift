//
//  WriteDiaryViewModel.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 9/5/21.
//

import SwiftUI
import Firebase
import UIKit

class WriteDiaryViewModel: ObservableObject{
    @Published var posts = [Post]()

    
    func addPostWithPic(caption: String, image: UIImage, relax: Bool, study: Bool, play: Bool, shopping: Bool, exercise: Bool){
        guard let user = AuthViewModel.shared.user else {return}
        
            guard let imageData = image.jpegData(compressionQuality: 0.3) else {return}
                let filename = NSUUID().uuidString
                let storageRef = Storage.storage().reference().child(filename)

                storageRef.putData(imageData, metadata: nil){ (_, err) in
                    if let Error = err{
                        
                        print("DEBUG: Failed to upload a image\(Error.localizedDescription)")
                        return
                    }

                    storageRef.downloadURL { url, _ in
                        guard let ImageUrl = url?.absoluteString else{return}
                        print("DEBUG: Add image is happening")

                        let post = Firestore.firestore().collection("users").document(user.uid).collection("Diary").document()

                        let data: [String: Any] = ["id": post.documentID,
                                                   "caption": caption,
                                                   "picURL": ImageUrl,
                                                   "timeStamp": Timestamp(date: Date()),
                                                   "relax": relax,
                                                   "study": study,
                                                   "play": play,
                                                   "shopping": shopping,
                                                   "exercise": exercise
                                                   ]

                        post.setData(data){ err in
                            if let err = err{
                                print("DEBUG: Post failed - \(err.localizedDescription)")
                                return
                            }
                            
                            self.fetchPosts()

                    }//set data
                }//download URL
            }//StorageRef putdata
    }//addPost
    
    
    func fetchPosts(){
        guard let user = AuthViewModel.shared.user else {return}
        Firestore.firestore().collection("users").document(user.uid).collection("Diary").getDocuments { snap, _ in
            guard let documents = snap?.documents else {return}
            
            self.posts = documents.map({Post(dictionary: $0.data())})
            self.posts.sort(by:{$0.timeStamp.dateValue() > $1.timeStamp.dateValue()})
        }
    }
    
    func deletePost(id : String){
        guard let user = AuthViewModel.shared.user else {return}
        Firestore.firestore().collection("users").document(user.uid).collection("Diary").document(id).delete()
        
        fetchPosts()
    }
}
