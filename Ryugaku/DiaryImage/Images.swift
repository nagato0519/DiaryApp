//
//  Images.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/10/21.
//

import SwiftUI
import Kingfisher

struct Images: View {
    @ObservedObject var viewModel = WriteDiaryViewModel()
    private var items = [GridItem(), GridItem(), GridItem()]
    private let width = UIScreen.main.bounds.width / 3
    
    @State var rotation:Double = 360
    
    init(){
        self.viewModel.fetchPosts()
    }
    
    var body: some View {
        NavigationView{
            ScrollView {
                
                ZStack {
                    LazyVGrid(columns: items, spacing: 1, content: {
                        ForEach(self.viewModel.posts){post in
        
                                NavigationLink(
                                    destination: DetailOfDiary(post: post),
                                    label: {
                                        
                                        KFImage(URL(string: post.picURL))
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: width, height: width)
                                            .clipped()
                                          

                                            
                                    })
                        }
                    })
                    
                    if self.viewModel.posts.count == 0{
                        
                        Text("Loading...")
                            .font(.headline)
                            .animation(.default)
                            .padding(.top, 60)
               
                    }
                    
                }
            }
            
            .navigationBarTitle("Memory", displayMode: .large)
            .navigationTitle("Memory")
            .navigationBarItems(trailing: Text("Day21"))
            
            
        }//NavigationView

        .onAppear{
            self.viewModel.fetchPosts()
            
        }

    }
}

struct Images_Previews: PreviewProvider {
    static var previews: some View {
        Images()
    }
}
