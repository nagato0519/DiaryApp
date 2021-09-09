//
//  WordCardViewModel.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 9/4/21.
//

import Firebase

class WordCardViewMoel: ObservableObject{
    @Published var word: Word
    @Published var liked = false

    init(word: Word){
        self.word = word
    }
    
    func likeWord(){
        guard let user = AuthViewModel.shared.user else {return}
        Firestore.firestore().collection("users").document(user.uid).collection("Likes").document(word.id).setData([:]){err in
            Firestore.firestore().collection("users").document(user.uid).collection("Words").document(self.word.id).updateData(["liked" : true])
            
            if let err = err{
                print("DEBUG: Add Word failed - \(err.localizedDescription)")
                return
            }
        }
        
        self.liked = true
    }
    
    func dislike(){
        guard let user = AuthViewModel.shared.user else {return}
        Firestore.firestore().collection("users").document(user.uid).collection("Likes").document(word.id).delete{ _ in
            
            Firestore.firestore().collection("users").document(user.uid).collection("Words").document(self.word.id).updateData(["liked" : false])
            
            self.liked = false
        }
    }
    
    func fetchLikedWords(){
        guard let user = AuthViewModel.shared.user else {return}
        Firestore.firestore().collection("users").document(user.uid).collection("Likes").document(word.id).getDocument{ snap, _ in
            
            guard let liked = snap?.exists else {return}
            self.liked = liked
        }
    }
    

}
