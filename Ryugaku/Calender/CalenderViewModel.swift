//
//  CalenderViewModel.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/13/21.
//

import SwiftUI

class CalenderViewModel: ObservableObject{
    @Published var dayTest: Date
    
    init(){
        self.dayTest = Date()
    }
}
