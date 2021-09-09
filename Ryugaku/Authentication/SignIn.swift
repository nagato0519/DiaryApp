//
//  SignIn.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 9/1/21.
//

import SwiftUI


struct SignIn: View {
    var body: some View {
        Button(action: {
            AuthViewModel.shared.createAccountAnonymously()
        }, label: {
            Text("Sign In")
        })
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
