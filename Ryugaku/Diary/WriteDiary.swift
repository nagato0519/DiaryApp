//
//  WriteDiary.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/6/21.
//

import SwiftUI
import UIKit

struct WriteDiary: View {
    
    @EnvironmentObject var obj: observed
    
    @ObservedObject var viewModel = WriteDiaryViewModel()
    
    @Binding var show: Bool
    
    @State var image: Image?
    @State var selectedUIImage: UIImage?
    @State var showingImagePicker = false
    
    @State var comment: String = ""
    
    @State var high : CGFloat = 0
    
    @State var relax = false
    @State var study = false
    @State var play = false
    @State var shopping = false
    @State var exercise = false
    
    
    func loadImage(){
        guard let selectedImage = selectedUIImage else {return}
        image = Image(uiImage: selectedImage)
    }
    
    var body: some View {
        ZStack {
            ScrollView{
                
                VStack(alignment: .center){

                    Text("How was your day?")
                        .font(.system(.title2))
                        .padding(.vertical)
                    
            
                    //MARK: - What did u do?

                    WhatDidYouDoView(relax: $relax, study: $study, play: $play, shopping: $shopping, exercise: $exercise)
                    
                    //what did u do?
                    

                    
                //MARK: - Memo -
                    
                    VStack {
                        HStack{
                            Image(systemName: "doc.plaintext")
                            
                            Text("Today's Comment")
                                .font(.subheadline)
                        }.padding(.top, 25)
                        
                        MultiTextField(text: $comment)
                            .frame(height: self.obj.size)
                            .padding(9)
                            .background(
                                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1.0).foregroundColor(.gray).opacity(0.5)
                            )

                            
                    }

                    
//                    Memo end
                    
                    //MARK: - Today's Picture -
                    
                    HStack{
                        Image(systemName: "camera")
                        
                        Text("Today's Photo")
                            .font(.subheadline)
                    }.padding(.top, 25)

                    
                    Button(action:{self.showingImagePicker.toggle()}){
                            
                            if let image = image{
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 200, height: 200)
                                    .clipped()
                                    .cornerRadius(10)
                            }else{
                            
                                HStack{
                                        Spacer()
                                        Text("Tap to Select Photo...")
                                            .foregroundColor(.gray)
                                        Spacer()
                                    }
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1.0).foregroundColor(.gray).opacity(0.5)
                                )
                            }//if image selected or not
                            
                        }//Label of button
                    .sheet(isPresented: $showingImagePicker,onDismiss: loadImage, content: {
                        ImagePicker(image: $selectedUIImage)
                    })
 
                    
                    //Today's photo end

//                MARK: - Save Button -

                    Button(action:{
                        guard let image = selectedUIImage else {return}
                            self.viewModel.addPostWithPic(caption: comment, image: image, relax: relax, study: study, play: play, shopping: shopping, exercise: exercise)
                        self.show = false
                        
                    }){
                        VStack{
                            Image(systemName: "checkmark.circle.fill")
                                .font(.system(size: 50))

                            Text("Save")
                        }
                    }.padding(.top,30)
                    //Save button end

                    Spacer()

                }//VStakc
                .padding(.top, 70)
                .padding(.horizontal)


                
            }//ScrollView
            .onTapGesture {
                  self.endTextEditing()
            }
            
            

        //MARK: - Top Bar -
            
            VStack(spacing: 0){
                
                ZStack {
                    HStack(alignment: .bottom){
                        
                        Button(action:{self.show = false}){
                            Image(systemName: "xmark")
                        }
                        
                        Spacer()

                        Button(action:{
                                guard let image = selectedUIImage else {return}
                                self.viewModel.addPostWithPic(caption: comment, image: image, relax: relax, study: study, play: play, shopping: shopping, exercise: exercise)
                            self.show = false
                        }){
                            HStack(spacing: 2){
                                Image(systemName: "checkmark.circle.fill")
                                Text("Save")
                            }
                        }
                        
                    }.padding(.horizontal)
                    .padding(.top, 30)
                    .padding(.bottom, 25)
                    .background(
                        Color(UIColor.systemBackground).opacity(0.95)
                )
                    
                    VStack(spacing: 3){
                        Text("留学７日目")
                            .font(.system(.callout))
                        Text("8/6/2021")
                            .font(.system(.caption))
                    }
                    
                }
                
                Rectangle().frame(width: .infinity, height: 1)
                    .foregroundColor(.gray)
                
                Spacer()
            }.ignoresSafeArea()
            
       
        }
    }
    
   
}

//MARK: - Helper -



//
//struct WriteDiary_Previews: PreviewProvider {
//    static var previews: some View {
//        WriteDiary()
//    }
//}
