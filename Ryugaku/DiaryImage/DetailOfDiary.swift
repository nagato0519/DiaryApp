//
//  DetailOfDiary.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/10/21.
//

import SwiftUI
import Kingfisher

struct DetailOfDiary: View {
    let post: Post
    @Environment(\.colorScheme) var colorScheme
    
    @State var liked = false
    @State var AskDelete = false

    
    let width =  UIScreen.main.bounds.width*0.8
    
    var body: some View {
        
        ZStack {
            ScrollView{
                VStack{
                    
                    HStack(alignment: .center){

                            Text("Day 4")
                                .font(.system(.title))
                                .fontWeight(.semibold)
                            
                            
                            Text("- \(post.dateString)")
                                .font(.system(.callout))
                        
                        
                        Spacer()
                        
                        Button(action:{self.AskDelete.toggle()}){
                            Image(systemName: "trash")
                                .offset(y: -1)
                                .font(.system(size: 20))
                        }.padding(.trailing, 10)
                        

                        
                        
                    }.padding(.horizontal)

                    KFImage(URL(string: post.picURL))
                        .resizable()
                        .scaledToFill()
                        .frame(width: width, height: width)
                        .clipped()
                        .cornerRadius(10)

                    Text(post.caption)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    Spacer()
                }.padding(.top, 127)
            }.foregroundColor(colorScheme == .dark ? .white : .black)
            
            if AskDelete{

                AskDeleteView(showDelete: $AskDelete, postID: post.id)
            }
        }.ignoresSafeArea()
    
    }//View
}



//struct DetailOfDiary_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailOfDiary()
//    }
//}
