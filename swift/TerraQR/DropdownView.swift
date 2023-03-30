//
//  ContentView.swift
//  TerraQR
//
//  Created by Dan Taeyoung on 3/29/23.
//

import SwiftUI
import OnPasteboardChange



struct DropdownView: View {
    @State private var dataString: String = "hello!!!"
    

    // Handle clipboard changed notification
    func clipboardChanged(_ notification: Notification) {
        print("clipboard changed")
    }
    
    var body: some View {
        VStack {
            QRCode(dataString: $dataString)
            VStack(alignment: .leading) {
                TextEditor( text: $dataString)
                    .frame(height: 60.0)
        
                HStack() {
                    Button("Paste") {
                        dataString = getPasteboardString()
                        
                    }
                    Spacer()
                    Button("Quit") {
                        exit(0)
                    }
                }
            }
            .onAppear {
                dataString = getPasteboardString()

                
            }
            .onPasteboardChange {
                dataString = getPasteboardString()
            }
                
                
                
        }
        .padding()
    }
    
    func getPasteboardString() -> String {
        let pasteboard = NSPasteboard.general
        if let string = pasteboard.string(forType: .string) {
            return(string)
        }
        return("")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownView()
    }
}
