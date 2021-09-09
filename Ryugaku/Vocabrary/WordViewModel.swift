//
//  WordViewModel.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/29/21.
//

import Firebase

class WordViewModel: ObservableObject{
    @Published var words = [Word]()
    @Published var likedList = [Word]()
    @Published var randomWords = [Word]()
    
    
    
    func fetchWords(){
        guard let user = AuthViewModel.shared.user else {return}
        
        Firestore.firestore().collection("users").document(user.uid).collection("Words").getDocuments { snap, _ in
            guard let documents = snap?.documents else {return}
            
            self.words = documents.map({Word(dictionary: $0.data())})
            self.randomWords = documents.map({Word(dictionary: $0.data())})

            self.randomWords.shuffle()
            self.words.sort(by:{$0.timeStamp.dateValue() > $1.timeStamp.dateValue()})
        }
    }
    

    
    
    func addWord(English: String, Japanese: String){
        guard let user = AuthViewModel.shared.user else {return}
        
        let word = Firestore.firestore().collection("users").document(user.uid).collection("Words").document()
        
        let data: [String: Any] = ["id": word.documentID,
                                   "English": English,
                                   "Japanese": Japanese,
                                   "timeStamp": Timestamp(date: Date())]
        
        word.setData(data){ err in
            if let err = err{
                print("DEBUG: Add Word failed - \(err.localizedDescription)")
                return
            }
            
            self.fetchWords()
        }
    }
    



    
    func fetchLikedWordsList(){
        guard let user = AuthViewModel.shared.user else {return}
        
        Firestore.firestore().collection("users").document(user.uid).collection("Words").whereField("liked", isEqualTo: true).getDocuments { snap, _ in
            
            guard let documents = snap?.documents else {return}
            
            self.likedList = documents.map({Word(dictionary: $0.data())})
            self.likedList.sort(by:{$0.timeStamp.dateValue() > $1.timeStamp.dateValue()})
            
        }
    }
    
    
}
