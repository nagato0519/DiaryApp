//
//  CalenderView.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/10/21.
//

import SwiftUI

struct CalenderView: View {
    @ObservedObject var viewModel = WriteDiaryViewModel()
    @State var selectedDate: Date = Date()
    
    var body: some View {
    
        NavigationView {
            ScrollView{
                    VStack{

                        CalenderRepresentable(posts: viewModel.posts, selectedDate: $selectedDate)
                            .frame(height: 300)
           
                        Text(dateString(date: selectedDate))
                            .padding()
                        
                        Text("今月のハイライト")
                            .font(.system(.headline))
                        
                        TabView{
                            
                            Image("nagato")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300)
                                .clipped()
                                .cornerRadius(10)
                            
                            Image("nagato")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300)
                                .clipped()
                                .cornerRadius(10)
                            
                            Image("nagato")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 300, height: 300)
                                .clipped()
                                .cornerRadius(10)
                            
                            
                        }.tabViewStyle(PageTabViewStyle())
                        .frame(width: UIScreen.main.bounds.width ,height: 300)
                        .padding(.bottom, 150)
                        
                        
                        
                    }
                }
            
            .navigationTitle("Calendar")
            .navigationBarTitleDisplayMode(.large)
            .navigationBarItems(trailing: Text("Day21"))
        }
        
        .onAppear{
            self.viewModel.fetchPosts()
        }

    }
}

func dateString(date: Date) -> String{
    let format = DateFormatter()
    format.dateFormat = "MMM d, yyyy"
    return format.string(from: date)
}

//MARK: - Test

struct CalenderView_Previews: PreviewProvider {
    static var previews: some View {
        CalenderView()
    }
}
