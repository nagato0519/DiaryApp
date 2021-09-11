//
//  DetailOfWord.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 9/10/21.
//

import SwiftUI

struct DetailOfWord: View {
    @ObservedObject var viewModel: WordCardViewMoel
    var word: Word
    
    @State var english: String
    @State var japanese: String
    
    init(word: Word){
        self.word = word
        self.english = word.English
        self.japanese = word.Japanese
        self.viewModel = WordCardViewMoel(word: word)
    }
    
    
    var body: some View {
        VStack{
            TextField("", text: $english)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1.0).foregroundColor(.gray).opacity(0.8)
                ).padding([.horizontal, .top])
            
            HStack{
                Text("Meaning").padding(.leading, 25)
                    .font(.callout)
                Spacer()
            }
            
            TextEditor(text: $japanese)
                .padding(8)
                .background(
                    RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1.0).foregroundColor(.gray).opacity(0.8)
                ).padding([.horizontal, .bottom])
            
            Spacer()
                .frame(height: 400)
            
        }
        
        .navigationTitle("Detail&Edit")
        .navigationBarItems(trailing:
                                Button(action: {self.viewModel.editWord(English: self.english, Japanese: self.japanese)}, label: {
                                    Text("Save")
                                })
        )
    }
}

struct DetailOfWord_Previews: PreviewProvider {
    static var previews: some View {
        DetailOfWord(word: Word(dictionary: ["id": "s", "English":"English", "Japanese":"英語という意味だと思っていたけど実際は全然違うくて結構困惑しています", "dayOfRyugaku": 3]))
    }
}
