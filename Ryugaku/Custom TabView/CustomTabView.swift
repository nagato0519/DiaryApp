//
//  CustomTabView.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/9/21.
//

import SwiftUI

struct CustomTabView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var isClicked: Bool = false
    
    @Binding var index: Int

    @Binding var writeDiary: Bool
    @Binding var addWord: Bool

    
    var body: some View {
        ZStack {
            
            if isClicked{
                Color.black.opacity(0.5).ignoresSafeArea()
            }
            
    //MARK: - Pop up buttons
            
            VStack{
                
                Spacer()
 
                Button(action:{self.writeDiary.toggle(); self.isClicked.toggle()}){
                    VStack{
                        Image(systemName: "pencil")
                            .font(.system(size: 30, weight: .semibold))
                            .padding(10)
                            .foregroundColor(.black)
                            .background(
                                Circle().foregroundColor(.white)
                            )
                            .overlay(
                                Circle().stroke(lineWidth: 2.0)
                            )

                        Text("日記を書く")
                            .font(.system(.caption))
                    }
                }

            }.offset(x: isClicked ? -70 : 6 ,y: isClicked ? -100 : -8)
            .animation(.spring())
            
            
            VStack {
                
                Spacer()

                Button(action:{self.addWord.toggle(); self.isClicked.toggle()}) {
                    VStack{
                        Image(systemName: "text.badge.plus")
                            .font(.system(size: 30, weight: .semibold))
                            .padding(10)
                            .foregroundColor(.black)
                            .background(
                                Circle().foregroundColor(.white)
                            )
                            .overlay(
                                Circle().stroke(lineWidth: 2.0)
                            )
                        
                        Text("単語を足す")
                            .font(.system(.caption))

                    }
                }
            }.offset(x: isClicked ? 70 : 6 ,y: isClicked ? -100 : -7)
            .animation(.spring())

            // Pop up button end
            
            VStack {
                
                Spacer()
                
                
                
                VStack {
                    HStack{
                        Button(action: {
                            self.index = 0
                        }, label: {
                            Image(systemName: "photo.on.rectangle.angled")
                                .font(.system(size: 25))
                        })
                        .foregroundColor( colorScheme == .dark ? .white : .black).opacity(self.index == 0 ? 1 : 0.2)
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            self.index = 1
                        }, label: {
                            Image(systemName: "calendar")
                                .font(.system(size: 25))
                        })
                        .foregroundColor( colorScheme == .dark ? .white : .black).opacity(self.index == 01 ? 1 : 0.2)
                        .offset(x: 9.0)
                        
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {self.isClicked.toggle()}) {
                            Image(systemName: "plus")
                                .font(.system(size: 37, weight: .semibold))
                                .rotationEffect(isClicked ? .degrees(45) : .degrees(0))
                                .animation(.spring())
                                .foregroundColor(colorScheme == .dark ? .black : .white)
                        }
                        .padding(10)
                        .background(Color(colorScheme == .dark ? .white : .black))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .offset(y: -20)

                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            self.index = 2
                        }, label: {
                            Image(systemName: "waveform.path.ecg")
                                .font(.system(size: 25))
                        })
                        .foregroundColor( colorScheme == .dark ? .white : .black).opacity(self.index == 2 ? 1 : 0.2)
                        .offset(x: -9.0)
                        
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {
                            self.index = 3
                        }, label: {
                            Image(systemName: "doc.text")
                                .font(.system(size: 25))
                        })
                        .foregroundColor( colorScheme == .dark ? .white : .black).opacity(self.index == 3 ? 1 : 0.2)
                    }.padding(.horizontal, 35)
                    
                    Spacer().frame(height: 40)
     
                }
                .background(Color(UIColor.systemBackground)).opacity(0.98)

            }.ignoresSafeArea()
            
        }
    }
}

//struct CustomTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTabView()
//    }
//}
