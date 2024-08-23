//
//  ContentView.swift
//  Academy-Credo
//
//  Created by Mahshad Jafari on 23.08.24.
//

import SwiftUI

extension Image {
    
    func imageModifire() -> some View {
        self
            .resizable()
            .scaledToFit()
    }
    func iconModifire() -> some View {
        self
            .imageModifire()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}

struct ContentView: View {
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    var body: some View {
       
        //MARK: -1. Basic
        //MARK: Phase
        
//        AsyncImage(url: URL(string: imageURL)) { phase in
//            
//            if let image = phase.image {
//                image.imageModifire()
//            }else if phase.error != nil {
//                Image(systemName: "ant.circle.fill").iconModifire()
//            }else {
//                Image(systemName: "photo.circle.fill").iconModifire()
//            }
//            
//        }.padding(40)

        AsyncImage(url: URL(string: imageURL), transaction: Transaction(animation: .spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.25))) { phase in
            switch phase {
            case .success(let image):
                image
                    .imageModifire()
//                    .transition(.move(edge: .bottom))
//                    .transition(.slide)
                    .transition(.scale)
            case .failure(_):
                Image(systemName: "ant.circle.fill").iconModifire()
            case .empty:
                Image(systemName: "photo.circle.fill").iconModifire()
            @unknown default:
                ProgressView()
            }
            
            
        }
        .padding(40)
        
    }
}

#Preview {
    ContentView()
}
