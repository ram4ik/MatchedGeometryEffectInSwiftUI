//
//  ContentView.swift
//  MatchedGeometryEffectInSwiftUI
//
//  Created by ramil on 08.02.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var show = false
    @Namespace var namespace
    
    var body: some View {
        ZStack {
            if !show {
                ScrollView {
                    HStack {
                        VStack {
                            Text("SwiftUI")
                                .matchedGeometryEffect(id: "title", in: namespace)
                                .foregroundColor(.primary)
                                .colorInvert()
                        }
                        .frame(width: 100, height: 100)
                        .background(
                            Rectangle()
                                .matchedGeometryEffect(id: "shape", in: namespace)
                                .frame(width: 100, height: 100)
                        )
                        
                        Rectangle()
                            .frame(width: 100, height: 100)
                        Spacer()
                    }
                }
            } else {
                VStack {
                    Text("SwiftUI")
                        .matchedGeometryEffect(id: "title", in: namespace)
                        .foregroundColor(.primary)
                        .colorInvert()
                        .font(.largeTitle)
                }
                .frame(maxWidth: .infinity, maxHeight: 400)
                .background(
                    Rectangle()
                        .matchedGeometryEffect(id: "shape", in: namespace)
                )
            }
        }.onTapGesture {
            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                show.toggle()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
