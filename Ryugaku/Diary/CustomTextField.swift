//
//  CustomTextField.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/11/21.
//

import SwiftUI

struct CustomTextField: View {
    
    @EnvironmentObject var obj: observed
    @State var text: String = "qqq"
    
    @State var high: CGFloat = 0
    var body: some View {
        VStack{
            MultiTextField(text: $text)
                .frame(height: self.obj.size)
                .padding(9)
                .background(Color.yellow)
                .cornerRadius(10.0)
        }.padding()
        .onAppear{
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { noti in
                let value = noti.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = value.height
                
                self.high = height
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) { noti in
      
                self.high = 0
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField().environmentObject(observed())
    }
}

struct MultiTextField: UIViewRepresentable{
    
    @Binding var text: String
    
    
    @EnvironmentObject var obj : observed
    
    func makeUIView(context: Context) -> UITextView {

            let view = UITextView()
            
            view.font = .systemFont(ofSize: 16)
            view.text = "What did you do?"
            view.textColor = UIColor.gray
            view.backgroundColor = .clear
            view.delegate = context.coordinator
        
        self.obj.size = view.contentSize.height
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.isScrollEnabled = true
            
            return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        
    }
    
    
    func makeCoordinator() -> Coordinator {
        return MultiTextField.Coordinator(parent1: self)
    }
    
    
    



    
    class Coordinator: NSObject, UITextViewDelegate{
        var parent: MultiTextField
        
        init(parent1: MultiTextField){
            parent = parent1
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .black
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
            self.parent.obj.size = textView.contentSize.height
        }
        
        
    }

    
}

class observed: ObservableObject{
    @Published var size: CGFloat = 0
}
