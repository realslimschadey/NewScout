//
//  Diff_Cards.swift
//  NewScout
//
//  Created by Michael Schade on 11/9/19.
//  Copyright © 2019 Michael Schade. All rights reserved.
//

import SwiftUI

struct scouting_opts: Identifiable{
    var id = UUID()
    var name = String()
    var image = String()
}

struct Diff_Cards: View {
    
    let diff_opts: [scouting_opts] = [
        scouting_opts(name: "hi", image: "DJI_0009"),
        scouting_opts(name: "h2", image:"DJI_0047")]
    
    var body: some View {
        NavigationView {
            List(diff_opts) { opt in
                /*
                NavigationLink(destination: DetailsView(index: opt.image)){
                    VStack(alignment: .leading){
                        Image(opt.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            Text(opt.name)
                            .font(.system(size: 15))
                    
                }
                */
                NavigationLink(destination: {
                    VStack{
                        if opt.name.contains("hi"){
                            ContentView()
                        }
                        if opt.name.contains("h2"){
                            PitInterview()
                        }
                    }
                }()){
                    Text("hello")
                }
        }
            }
        
    .navigationBarTitle(Text("Options"))
        .foregroundColor(Color.black)
    }

}
struct Diff_Cards_Previews: PreviewProvider {
    static var previews: some View {
        Diff_Cards()
    }
}

