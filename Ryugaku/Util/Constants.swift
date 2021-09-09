//
//  Constants.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/10/21.
//

import SwiftUI
import UIKit



extension View {
  func endTextEditing() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                    to: nil, from: nil, for: nil)
  }
}
