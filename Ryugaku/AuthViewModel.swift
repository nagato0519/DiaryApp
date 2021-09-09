//
//  AuthViewModel.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/29/21.
//

import SwiftUI
import Firebase
import FirebaseAuth


class AuthViewModel: ObservableObject{
    @Published var userSession: Firebase.User?
    @Published var user: User?

    static let shared = AuthViewModel()

    init(){
        userSession = Auth.auth().currentUser
        fetchUser()
    }

    func createAccountAnonymously(){
        Auth.auth().signInAnonymously() { result, error in
            if let err = error{
                print("DEBUG: Error in create account annonimously - \(err.localizedDescription)")
                return
            }

            guard let user = result?.user else{return}

            let data: [String : Any] = ["uid": user.uid]

            Firestore.firestore().collection("users").document(user.uid).setData(data){ _ in
                self.userSession = result?.user
                self.fetchUser()
            }// Firestore
        }
    }


    func fetchUser(){
        guard let uid = userSession?.uid else { return }

        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, err in
            if let error = err {
                print("DEBUG: error \(error.localizedDescription)")
                return
            }

            guard let data = snapshot?.data() else {return}

            self.user = User(dictionary: data)
        }
    }//Fetch User


}
