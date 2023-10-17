//
//  ContentView.swift
//  SMSU_7
//
//  Created by Andrei Kovryzhenko on 17.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showPopUp = false
    @Namespace private var namespace
    
    var body: some View {
        VStack {
            if !showPopUp {
                Button {
                    withAnimation(.easeInOut) {
                        showPopUp.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .matchedGeometryEffect(
                                id: "id",
                                in: namespace
                            )
                            .frame(width: 100, height: 50)
                        Text("Open")
                            .matchedGeometryEffect(
                                id: "text",
                                in: namespace
                            )
                            .foregroundColor(.white)
                            .font(.title3)
                            .bold()
                    }
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity,
                        alignment: .bottomTrailing)
                }
                .padding()
                
            } else {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.blue)
                        .matchedGeometryEffect(
                            id: "id",
                            in: namespace
                        )
                        .frame(width: 300, height: 400)
                    Button {
                        withAnimation(.easeInOut) {
                            showPopUp.toggle()
                        }
                    } label: {
                        Label("Back", systemImage: "arrowshape.backward.fill")
                            .matchedGeometryEffect(
                                id: "text",
                                in: namespace,
                                properties: .position)
                            .foregroundColor(.white)
                            .font(.title3)
                            .bold()
                    }
                    .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
