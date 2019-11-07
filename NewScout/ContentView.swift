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

struct ContentView: View {
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
        NavigationView {
            Form {
                Section(header: Text("Match Info")){
                    TextField("Team #", text: $team_number)
                    TextField("Match #", text: $match_number)
                    TextField("Auton", text: $auton_yn)
                }
                Stepper(value: $blue_score, in: 0...1000, label: {
                    Text("Blue Score: \(self.blue_score)")
                })
                Stepper(value: $red_score, in: 0...1000, label: {
                    Text("Red Score: \(self.red_score)")
                })
                Picker(selection: $alliance, label: Text("Alliance")){
                    ForEach(team_color.all_colors, id: \.self) { color in
                        Text(color).tag(color)
                    }
                }
                Section(){
                    TextField("Alliance Teammate #1:", text: $teammates1)
                    TextField("Alliance Teammate #2:", text: $teammates2)
                }
                Section(){
                    TextField("Enter any comments:", text: $comments)
                }
            
                
                
            }.navigationBarTitle(Text("RICE 870 Scouting"))
        }
    }
    
}

        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

