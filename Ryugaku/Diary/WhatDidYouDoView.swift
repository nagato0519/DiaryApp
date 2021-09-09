//
//  WhatDidYouDoView.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/24/21.
//

import SwiftUI

struct WhatDidYouDoView: View {
    @Binding var relax: Bool
    @Binding var study: Bool
    @Binding var play: Bool
    @Binding var shopping: Bool
    @Binding var exercise: Bool
    
    var body: some View {
        
        VStack {
            
            Text("What did you do?")
                .font(.system(.body))
                .padding(.bottom)
            
         
                HStack(alignment: .bottom){
                    Group{
                        
    
                    stamp(selected: $relax, image: "relax", title: "Relax")
                        
           
          

                        stamp(selected: $study, image: "study", title: "Study")
                    
                    
              
  
                        stamp(selected: $play, image: "play", title: "Play")
                    

                        stamp(selected: $shopping, image: "shopping", title: "Shopping")
                    
   
                 
                        stamp(selected: $exercise, image: "exercise", title: "Exercise")
                    
                }
                    

                }.font(.system(size: 30))
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1.0).foregroundColor(.gray).opacity(0.5)
            )
    }
}

struct stamp: View {
    @Binding var selected: Bool
    var image: String
    var title: String
    
    var body: some View{

        
        Button(action: {self.selected.toggle()}, label: {
            HStack{
                Spacer()
                VStack(spacing:3){
                    if self.selected{
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 40, height: 40)
                            .padding(1)
                            .background(
                                RoundedRectangle(cornerRadius: 10).foregroundColor(.green)
                            )
                    }else{
                        Image(image)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: 40, height: 40)
                            .padding(1)
                    }
                    
                    Text(title)
                        .font(.system(size: 8))

                }
                
                Spacer()
            }

        })


    }
}

//struct WhatDidYouDoView_Previews: PreviewProvider {
//    static var previews: some View {
//        WhatDidYouDoView()
//    }
//}
