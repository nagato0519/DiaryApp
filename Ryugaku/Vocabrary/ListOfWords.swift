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
                
                HStack(alignment: .center,spacing: 60){

                    VStack {

                        Button(action:{self.selected = 0;}){


                            if selected == 0{
                                Text("Timeline")
                                    .foregroundColor(.green)
                            }else{
                                Text("Timeline")
                            }
                        }
                        
                        Rectangle()
                            .frame(width: 80, height: 2)
                            .foregroundColor(selected == 0 ? .green : .white)
                            .animation(.easeIn)

                    }



                    VStack {
                        Button(action:{self.selected = 1 }){

                            if selected == 1{
                                Text("Favorites")
                                    .foregroundColor(.green)
                            }else{
                                Text("Favorites")
                            }

                        }
                        
                        
                        Rectangle()
                            .frame(width: 80, height: 2)
                            .foregroundColor(selected == 1 ? .green : .white)
                            .animation(.easeIn)
                    }

                    
                    VStack {
                        Button(action:{self.selected = 2;barDistace = 295}){

                            if selected == 2{
                                Text("Random")
                                    .foregroundColor(.green)
                            }else{
                                Text("Random")
                            }
                        }
                        
                        Rectangle()
                            .frame(width: 80, height: 2)
                            .foregroundColor(selected == 2 ? .green : .white)
                            .animation(.easeIn)
                    }
                }.frame(height: 40)
                .padding(.bottom, 2)
                .padding(.horizontal)

                
                
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
            self.viewModel.fetchLikedWordsList()
        }
    }
}
