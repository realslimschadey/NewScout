//
//  ContentView.swift
//  NewScout
//
//  Created by Michael Schade on 11/6/19.
//  Copyright © 2019 Michael Schade. All rights reserved.
//

import SwiftUI



struct team_color{
    static let all_colors = [
        "Red Alliance",
        "Blue Alliance"
    ]
}

struct KeyboardHost<Content: View>: View{
    let view: Content

    @State private var keyboardHeight: CGFloat = 0

    private let showPublisher = NotificationCenter.Publisher.init(
        center: .default,
        name: UIResponder.keyboardWillShowNotification
    ).map { (notification) -> CGFloat in
        if let rect = notification.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect {
            return rect.size.height
        } else {
            return 0
        }
    }

    private let hidePublisher = NotificationCenter.Publisher.init(
        center: .default,
        name: UIResponder.keyboardWillHideNotification
    ).map {_ -> CGFloat in 0}

    // Like HStack or VStack, the only parameter is the view that this view should layout.
    // (It takes one view rather than the multiple views that Stacks can take)
    init(@ViewBuilder content: () -> Content) {
        view = content()
    }
    
    var body: some View {
            VStack {
                view
                Rectangle()
                    .frame(height: keyboardHeight)
                    .animation(.default)
                    .foregroundColor(.clear)
            }.onReceive(showPublisher.merge(with: hidePublisher)) { (height) in
                self.keyboardHeight = height
            }
        }
    }

struct ContentView: View{
    
    
    @State private var team_number = ""
    @State private var match_number = ""
    @State private var auton_yn = ""
    @State private var blue_score = 0
    @State private var red_score = 0
    @State private var alliance = ""
    @State private var teammates1 = ""
    @State private var teammates2 = ""
    @State private var comments = ""
    
    var body: some View {
        NavigationView{
        KeyboardHost {
            Form {
                Section(header: Text("Match Info")){
                    TextField("Team #", text: $team_number).keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Match #", text: $match_number).keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Auton", text: $auton_yn)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Stepper(value: $blue_score, in: 0...1000, label: {
                    Text("Blue Score: \(self.blue_score)")
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                })
                Stepper(value: $red_score, in: 0...1000, label: {
                    Text("Red Score: \(self.red_score)")
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                })
                Picker(selection: $alliance, label: Text("Alliance")){
                    ForEach(team_color.all_colors, id: \.self) { color in
                        Text(color).tag(color)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                Section(){
                    TextField("Alliance Teammate #1:", text: $teammates1).keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Alliance Teammate #2:", text: $teammates2).keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                  
                }
                Section(){
                    TextField("Enter any comments:", text: $comments)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            
            }
            }.navigationBarTitle(Text("RICE 870 Scouting"))
    }
            
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
