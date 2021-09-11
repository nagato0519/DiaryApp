//
//  List.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 9/2/21.


import SwiftUI


let words = [Word(dictionary: ["English" : "English", "Japanese": "英語","dayOfRyugaku": 3]), Word(dictionary: ["English" : "English", "Japanese": "英語", "dayOfRyugaku": 3]), Word(dictionary: ["English" : "English", "Japanese": "英語", "dayOfRyugaku": 3]),  Word(dictionary: ["English" : "English", "Japanese": "英語", "dayOfRyugaku": 3]), Word(dictionary: ["English" : "English", "Japanese": "英語", "dayOfRyugaku": 3])]


enum thread{
    case Timeline
    case Favorite
    case Random
}

struct List: View {


    @State var selected = 0
    @State var barDistace: CGFloat = CGFloat(42)

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

                ScrollView{
                    VStack{
                        ForEach(words){ word in
                            WordCard(showJapanese: false, word: word)
                        }
                    }.padding(.top)
                }

                .navigationBarTitle("Vocabulary", displayMode: .large)
                .navigationBarItems(trailing: Text("Day21"))
            }
        }
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        List()
    }
}
