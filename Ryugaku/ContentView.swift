//
//  ContentView.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/6/21.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var showDiary: Bool = false
    @State var showAddWord: Bool = false
    @State var index = 0
    
    
    @State var showIn: Bool = true
    
    @ObservedObject var viewModelWords = WordViewModel()
    
    
    var body: some View {

        ZStack{
            
            if viewModel.userSession != nil{
            
                if self.index == 0{
                    Images()
                }else if self.index == 1{
                    CalenderView()
                }else if self.index == 2{
                    StatsView()
                }else if self.index == 3{
                    ListOfWords(viewModel: self.viewModelWords)
                        .foregroundColor(colorScheme == .dark ? .white: .black)
                }
                
                VStack{
                    
                    Spacer()

                    CustomTabView(index: self.$index, writeDiary: self.$showDiary, addWord: self.$showAddWord)
                        .foregroundColor(colorScheme == .dark ? .white: .black)
                        
                }
                
            }else{
        
                Button(action:{AuthViewModel.shared.createAccountAnonymously(); self.showIn = false}, label:{
                    Text("SignIn")
                })
            
            }

        }
        
        
        .sheet(isPresented: self.$showAddWord, content: {
            AddWord(viewModel: self.viewModelWords,show: $showAddWord)
                .foregroundColor(colorScheme == .dark ? .white : .black)
        })

        
        .sheet(isPresented: self.$showDiary, content: {
            WriteDiary(show: $showDiary)
                .foregroundColor(colorScheme == .dark ? .white: .black)
        })

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
