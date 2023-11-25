//
//  ContentView.swift
//  HelloWorld
//
//  Created by Rudolph Balaz on 10/9/23.
//

import SwiftUI
import CxxStdlib
import HelloLib

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            var hw = HelloLib()
            let s: std.string = hw.getHelloWorldString()
            Text(String(s))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
