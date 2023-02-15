//
//  LoadingView.swift
//  PizzaBytes
//
//  Created by Prashant Lohani on 16/02/23.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            Text("Loading......").font(.system(size: 48))
            ProgressView()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
