//
//  DetailsView.swift
//  NewScout
//
//  Created by Michael Schade on 11/9/19.
//  Copyright © 2019 Michael Schade. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    var index: String
    var body: some View{
        NavigationView(){
            Image("A\(index)")
            .resizable()
            .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(index: "1")
    }
}
