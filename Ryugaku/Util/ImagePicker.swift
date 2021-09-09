//
//  ImagePicker.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/6/21.
//


import SwiftUI

struct ImagePicker: UIViewControllerRepresentable{
    @Binding var image: UIImage?
    @Environment(\.presentationMode) var mode
    
    func makeCoordinator() -> Cordinaor {
        Cordinaor(self)
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }

}

extension ImagePicker{
    class Cordinaor: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        let parent: ImagePicker
        
        init(_ parent: ImagePicker){
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            guard let image = info[.originalImage] as? UIImage else {return}
            parent.image = image
            parent.mode.wrappedValue.dismiss()
            
        }
    }
}

