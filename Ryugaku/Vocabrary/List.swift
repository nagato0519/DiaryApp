//
//  List.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 9/2/21.
//

//import SwiftUI
//
//
//let words = [Word(dictionary: ["English" : "English", "Japanese": "英語","dayOfRyugaku": 3]), Word(dictionary: ["English" : "English", "Japanese": "英語", "dayOfRyugaku": 3]), Word(dictionary: ["English" : "English", "Japanese": "英語", "dayOfRyugaku": 3]),  Word(dictionary: ["English" : "English", "Japanese": "英語", "dayOfRyugaku": 3]), Word(dictionary: ["English" : "English", "Japanese": "英語", "dayOfRyugaku": 3])]
//
//
//enum thread{
//    case Timeline
//    case Favorite
//    case Random
//}
//
//struct List: View {
//
//
//    @State var selected = 0
//    @State var barDistace: CGFloat = CGFloat(42)
//
//    var body: some View {
//
//        NavigationView{
//
//            VStack(spacing: 0) {
//
//                HStack(alignment: .center,spacing: 60){
//
//                    VStack {
//
//                        Button(action:{self.selected = 0; barDistace = 42}){
//
//
//                            if selected == 0{
//                                Text("Timeline")
//                                    .foregroundColor(.green)
//                            }else{
//                                Text("Timeline")
//                            }
//
//
//                        }
//                    }
//
//
//
//                    Button(action:{self.selected = 1 ;barDistace = 165}){
//
//                        if selected == 1{
//                            Text("Favorites")
//                                .foregroundColor(.green)
//                        }else{
//                            Text("Favorites")
//                        }
//
//                    }
//
//
//                    Button(action:{self.selected = 2;barDistace = 295}){
//
//                        if selected == 2{
//                            Text("Random")
//                                .foregroundColor(.green)
//                        }else{
//                            Text("Random")
//                        }
//
//
//                    }
//                }.frame(height: 40)
//                .padding(.bottom, 2)
//                .padding(.horizontal)
//
//                HStack{
//                Rectangle()
//                    .frame(width: 80, height: 2)
//                    .foregroundColor(.green)
//                    .animation(.easeIn)
//                    .padding(.leading, barDistace)
//
//                    Spacer()
//                }
//
//
//            //Select Bar End
//
//                ScrollView{
//                    VStack{
//                        ForEach(words){ word in
//                            WordCard(viewModel: self.viewMdoel, showJapanese: false, word: word)
//                        }
//                    }.padding(.top)
//                }
//
//                .navigationBarTitle("Vocabulary", displayMode: .large)
//                .navigationBarItems(trailing: Text("Day21"))
//            }
//
//        }
//
//
//    }
//}
//
//struct List_Previews: PreviewProvider {
//    static var previews: some View {
//        List()
//    }
//}
