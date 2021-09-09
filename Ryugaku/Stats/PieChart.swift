//
//  PieChart.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/24/21.
//

import SwiftUI

struct PieChart: View {
    var body: some View {
        HStack(alignment: .center){
                ZStack{
                    Button(action: {}, label: {
                        Circle()
                            .stroke(lineWidth: 20)
                            .frame(width: 100, height: 100)
                            .opacity(0.8)
                            .foregroundColor(.blue)
                    })
         

                    
                    Circle()
                        .trim(from: 0.0, to: 0.3)
                        .stroke(style: StrokeStyle(lineWidth: 20))
                        .frame(width: 100, height: 100)
                        .animation(.easeIn)
                        .foregroundColor(.pink)
                    
                    Circle()
                        .trim(from: 0.3, to: 0.4)
                        .stroke(style: StrokeStyle(lineWidth: 20))
                        .frame(width: 100, height: 100)
                        .animation(.easeIn)
                        .foregroundColor(.green)
                    
                    Circle()
                        .trim(from: 0.4, to: 0.8)
                        .stroke(style: StrokeStyle(lineWidth: 20))
                        .frame(width: 100, height: 100)
                        .animation(.easeIn)
                        .foregroundColor(.gray)

                }
                
        }
    }
}

struct PieChart_Previews: PreviewProvider {
    static var previews: some View {
        PieChart()
    }
}
