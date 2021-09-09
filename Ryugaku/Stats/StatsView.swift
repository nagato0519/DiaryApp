//
//  StatsView.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/13/21.
//

import SwiftUI
import SwiftUICharts
import iLineChart

struct StatsView: View {
    
    var numbers: [Double] = [1.0, 2.9, 30.0, 56.0, 78.2, 88.0, 20.0]
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack {
                    
                    //MARK: - Goal
                    VStack(alignment: .center){
                        
                        HStack{Spacer()
                            Text("Goal")
                                .font(.headline)
                            Spacer()
                        }.padding(.bottom, 2)
                

                        
                        Button(action: {}, label: {
                            Text("アメリカ就職する")
                                .fontWeight(.medium)
                        })

                        
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1.0).foregroundColor(.gray).opacity(0.8)
                    ).padding(.horizontal)
                    
                    //Goal end
                    
                    //MARK: - Your Life
                    
                    VStack {
                        HStack{
                            Spacer()
                            Text("Your Life")
                                .font(.headline)
                            
                            Spacer()
                        }
                        PieChart()
                            .padding()
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1.0).foregroundColor(.gray).opacity(0.8)
                    ).padding(.horizontal)
                    .padding(.vertical, 10)
                    
                    //Your goal end
                    
                  
                    
                  VocabularyChartView()
                    .padding(.horizontal)
                    
      
       
                }//VSTACK

            }
            .navigationBarTitle("Stats", displayMode: .large)
        }
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
