//
//  MainView.swift
//  NewScout
//
//  Created by Michael Schade on 11/9/19.
//  Copyright © 2019 Michael Schade. All rights reserved.
//

import SwiftUI

/*
struct scout_options{
    static let all_options = [
        "Pit Interviews",
        "Match Scouting"
    ]
}
 */

struct MainView: View {
    var body: some View {
        NavigationView{
            List{
            NavigationLink(destination: ContentView()){
                Button("Match Scouting"){
                }
            }
                
                NavigationLink(destination: Diff_Cards()){
                               Button("Pit Interview2"){
                               }
                           }
            /*
                VStack{
                    
                    ForEach(scout_options.all_options, id: \.self) { scouter_opt in
                        Text(scouter_opt).tag(scouter_opt)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 300)
                            .padding(200)
                    
                    NavigationLink(destination: PitInterview()){
                        Button("Pit Interview"){
                            print("pressed")
                        }
                    }
                    .padding()
                        
                    NavigationLink(destination: Diff_Cards()){
                        Button("Next Screen"){
                            print("pressed")
                        }
                    }
                .padding()
                    
                }
        }.navigationBarTitle(Text("Ya"))
    }
 
}
 
                 */
            }
            
        }.navigationViewStyle(StackNavigationViewStyle())
        .padding(0)
            }
        }
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

