//
//  WordCard.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/6/21.
//

import SwiftUI


struct WordCard: View {
    
    @ObservedObject var viewModel: WordCardViewMoel
    @State var showJapanese: Bool = false
    
    @State var word: Word = Word(dictionary: ["id": "s","English" : "English", "Japanese": "英語", "dayOfRyugaku": 3])
    
    init(showJapanese: Bool, word: Word){
        self.showJapanese = false
        self.word = word
        self.viewModel = WordCardViewMoel(word: word)
        viewModel.fetchLikedWords()
    }
    
    var body: some View {
        

        
        ZStack(alignment: .top) {
            Button(action: {self.showJapanese.toggle()}){
                            HStack{
                                
                                Spacer()

                                ZStack{
                                    
                                    Text( showJapanese ? word.Japanese : word.English)
                             
                                }.font(.system(size: 25, weight: .semibold))

                                
                                Spacer()
                            }
                            

                }
            .frame(width:UIScreen.main.bounds.width*0.9, height: 130)
            .overlay(
                RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 1)
            )
            
            HStack{
                NavigationLink(
                    destination: Text("Destination"),
                    label: {
                        
                                Image(systemName: "ellipsis")
                    })
                    .padding(.leading, 30)
                    .padding(.top, 10)
                
                Spacer()
                
                Button(action:{self.viewModel.liked ? self.viewModel.dislike() : self.viewModel.likeWord()}){
                        
                        Image(systemName: self.viewModel.liked ? "star.fill" : "star")
                            .foregroundColor(self.viewModel.liked ? .pink : .black)
      
                }.padding(.trailing, 30)
                .padding(.top, 10)
            }

        }
        
        .onAppear{
           self.viewModel.fetchLikedWords()
        }
        
    }
}
//
//struct WordCard_Previews: PreviewProvider {
//    static var previews: some View {
//        WordCard()
//    }
//}
