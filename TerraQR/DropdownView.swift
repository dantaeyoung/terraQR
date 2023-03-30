//
//  ContentView.swift
//  TerraQR
//
//  Created by Dan Taeyoung on 3/29/23.
//

import SwiftUI



struct DropdownView: View {
    @State private var dataString: String = "hello!!!"

    var body: some View {
        VStack {
            QRCode(dataString: $dataString)
            VStack(alignment: .leading) {
                TextField("Clipboard", text: $dataString)
                    
    .font(.title)
                Button("Paste") {
                    let pasteboard = NSPasteboard.general
                    if let string = pasteboard.string(forType: .string) {
                        dataString = string
                    }
                }
                Button("Quit") {
                    exit(0)
                }
            }

                
                
                
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownView()
    }
}
