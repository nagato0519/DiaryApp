//
//  ListOfWords.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/6/21.
//

import SwiftUI

struct ListOfWords: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel:WordViewModel

    @State var selected = 0
    @State var barDistace: CGFloat = CGFloat(20)
    
    var body: some View {
      
        NavigationView{
            
            
            VStack(spacing: 0) {
                
                HStack(alignment: .center, spacing: 60){
                    
                    VStack {
                        Button(action:{self.selected = 0; barDistace = 42}){
                            
                            if selected == 0{
                                Text("Timeline")
                                    .foregroundColor(.green)
                            }else{
                                Text("Timeline")
                            }
      
                        }
                    }
                    

                    
                    Button(action:{self.viewModel.fetchLikedWordsList();self.selected = 1 ;barDistace = 165}){
                        
                        if selected == 1{
                            Text("Favorites")
                                .foregroundColor(.green)
                        }else{
                            Text("Favorites")
                        }
           
                    }
  
                    
                    Button(action:{self.selected = 2;barDistace = 295}){
                        
                        if selected == 2{
                            Text("Random")
                                .foregroundColor(.green)
                        }else{
                            Text("Random")
                        }
                  
                        
                    }
                }.frame(height: 40)
                .padding(.bottom, 2)
                .padding(.horizontal)
                
                HStack{
                Rectangle()
                    .frame(width: 120, height: 2)
                    .foregroundColor(.green)
                    .animation(.easeIn)
                    .padding(.leading, barDistace)
                    
                    Spacer()
                }
                
                
            //Select Bar End
                if selected == 0{
                    ScrollView{
                        VStack{
                            ForEach(self.viewModel.words){ word in
                                WordCard(showJapanese: false, word: word)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }.padding(.top)
                    }
                }else if selected == 1{
                    ScrollView{
                        VStack{
                            ForEach(self.viewModel.likedList){ word in
                                WordCard(showJapanese: false, word: word)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }.padding(.top)
                    }
                }else{
                    ScrollView{
                        VStack{
                            ForEach(self.viewModel.randomWords){ word in
                                WordCard(showJapanese: false, word: word)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }.padding(.top)
                    }
                }
 
            }
            
            .navigationBarTitle("Vocabulary", displayMode: .large)
            .navigationBarItems(trailing: Text("Day21"))
        }
        
        .onAppear{
            self.viewModel.fetchWords()
        }
    }
}
