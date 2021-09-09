//
//  Calender.swift
//  Ryugaku
//
//  Created by Nagato Kadoya on 8/10/21.
//

import SwiftUI
import FSCalendar

struct CalenderRepresentable: UIViewRepresentable{
    typealias UIViewType = FSCalendar
    var posts: [Post]
    
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var selectedDate: Date
    
    var calender = FSCalendar()
    let dateFormatter = DateFormatter()

    
    func makeCoordinator() -> Cordinator {
        
        return Coordinator(self, posts: self.posts)

    }
    


    
    func makeUIView(context: Context) -> FSCalendar {
        calender.delegate = context.coordinator
        calender.dataSource = context.coordinator
        
            //: Customize
        calender.appearance.headerTitleFont = UIFont.systemFont(ofSize: 20, weight: .semibold)
        calender.appearance.weekdayFont = UIFont.systemFont(ofSize: 15, weight: .semibold)
        calender.appearance.headerTitleColor = colorScheme == .dark ? .white: .black
        calender.appearance.weekdayTextColor = colorScheme == .dark ? .white: .black
        calender.appearance.titleTodayColor = colorScheme == .dark ? .white: .black
        calender.appearance.titleDefaultColor = colorScheme == .dark ? .white: .black
        calender.appearance.headerMinimumDissolvedAlpha = 0

        
        

        return calender
    }//: Make UIView
    
    
    func updateUIView(_ uiView: FSCalendar, context: Context) {
        
        
        
    }
    
    
    
    

    
    class Cordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource{
        var parent: CalenderRepresentable
        let dateFormatter = DateFormatter()
        var posts: [Post]

        
        init(_ parent: CalenderRepresentable, posts: [Post]){
            self.parent = parent
            self.posts = posts
            dateFormatter.dateFormat = "dd-MM-yyyy"
            print("init of cordinator happen")
        }
        
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            
            let day = dateFormatter.string(from: date)

            for post in posts{
                let eventDate = dateFormatter.string(from: post.timeStamp.dateValue())
                if day == eventDate{
                    return 1
                }
            }
            return 0
            
        }
        
 
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            
            parent.selectedDate = date
            
            
        }
    }

    

    
    

}//: Calender representable

//
//struct Calender_Previews: PreviewProvider {
//    static var previews: some View {
//        CalenderRepresentable()
//            .frame(height: 300)
//    }
//}
