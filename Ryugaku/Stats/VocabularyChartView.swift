//
//  VocabularyChartView.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/24/21.
//

import SwiftUI
import iLineChart

struct VocabularyChartView: View {
    var body: some View {
        VStack {
            Text("Vocabulary")
                .font(.headline)
            iLineChart(
                data: [8,32,11,23,40,28,15,20,30,25, 200],
                  displayChartStats: true
            )
        }
        .padding()
        .frame(height: 300)
        .background(
            RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1.0).foregroundColor(.gray).opacity(0.8)
        )
        
        
    }
}

struct VocabularyChartView_Previews: PreviewProvider {
    static var previews: some View {
        VocabularyChartView()
    }
}
