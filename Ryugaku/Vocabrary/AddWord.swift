//
//  AddWord.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/6/21.
//

import SwiftUI

struct AddWord: View {
    @ObservedObject var viewModel: WordViewModel
    
    @Binding var show: Bool
    
    @State var newWord: String = ""
    @State var mean: String = ""
    var body: some View {
        VStack(alignment: .leading){
        
            

            HStack{
                Spacer()
                
                Button(action: {self.viewModel.addWord(English: newWord, Japanese: mean); self.show = false}){
  
                    HStack(spacing: 2){
                        Image(systemName: "plus.circle")
                        
                        Text("Add")
                            .padding(.trailing, 20)
                    }
                }
            }.padding(.vertical)
            
            Text("新しい単語")
                .fontWeight(.medium)
                .padding(.leading, 25)
            
            TextField("単語", text: $newWord)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1.0)
                ).padding(.horizontal)
            
            Text("単語の意味")
                .fontWeight(.medium)
                .padding(.leading, 25)
                .padding(.top)
            
            TextField("意味", text: $mean)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 1.0)
                ).padding(.horizontal)
            
        }
        
        
    }
}

//struct AddWord_Previews: PreviewProvider {
//    static var previews: some View {
//        AddWord()
//    }
//}
