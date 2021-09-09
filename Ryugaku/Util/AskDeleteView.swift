//
//  AskDeleteView.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/11/21.
//

import SwiftUI

struct AskDeleteView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var showDelete: Bool
    
    var body: some View {
        ZStack {
            
            Color.black
                .opacity(0.5)
                .ignoresSafeArea()
            
            VStack{
                Text("Delete This Post")
                    .font(.headline)
                    .padding([.top, .horizontal])
                    .padding(.bottom, 1)
                    .foregroundColor(.black)
                
                Text("Are you sure to delete this post?")
                    .foregroundColor(.black)
                    .font(.subheadline)
                
                HStack(spacing: 0){
                    Button(action: {}, label: {
                        HStack {
                            Spacer()
                            Text("Delete")
                                .foregroundColor(.pink)
                            Spacer()

                        }
                        .frame(height: 50)
                    })
                    
                    
                    Divider()
                    
                    Button(action: {self.showDelete = false}, label: {
                        HStack {
                            Spacer()
                            Text("Cancel")
                                .foregroundColor(.blue)
                            Spacer()
                        }
                        .frame(height: 50)
                    })
                    

                }
                .frame(width: 250, height: 50)
            }
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.white)
            )
        }
    }}

