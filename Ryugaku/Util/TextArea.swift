//
//  TextArea.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/6/21.
//

import SwiftUI

struct TextArea: View {
    
        @Binding var text: String
        let placeholder: String
        
        init(placeholder: String, text: Binding<String>) {
            self._text = text
            self.placeholder = placeholder
            
            UITextView.appearance().backgroundColor = .clear
            
        }
        
        var body: some View {
            ZStack(alignment: .topLeading) {
                if text.isEmpty {
                    Text(self.placeholder)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 12)
                }
                
                
                    
            }.font(.body)
            
        }
    
}
