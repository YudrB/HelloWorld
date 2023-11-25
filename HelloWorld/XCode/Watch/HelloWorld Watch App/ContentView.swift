//
//  ContentView.swift
//  HelloWorld Watch App
//
//  Created by Rudolph Balaz on 10/16/23.
//

import SwiftUI
import Foundation

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            let objcInstance = HelloWatch()
            
            Text(objcInstance.getHelloWorld())
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
