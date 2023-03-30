//
//  QRCode.swift
//  TerraQR
//
//  Created by Dan Taeyoung on 3/29/23.
//

import SwiftUI
import CoreImage.CIFilterBuiltins




struct QRCode: View {

    @State internal var qrCodeImage: NSImage = NSImage()

    @Binding var dataString: String
    

    var body: some View {
        
        
        HStack {
            Image(nsImage: qrCodeImage)
                .resizable()
                .interpolation(.none)
                .frame(width: 100.0, height: 100.0)
            Image(nsImage: qrCodeImage)
                .resizable()
                .interpolation(.none)
                .frame(width: 200.0, height: 200.0)
            Image(nsImage: qrCodeImage)
                .resizable()
                .interpolation(.none)
                .frame(width: 400.0, height: 400.0)
            Image(nsImage: qrCodeImage)
                .resizable()
                .interpolation(.none)
                .frame(width: 200.0, height: 200.0)
            Image(nsImage: qrCodeImage)
                .resizable()
                .interpolation(.none)
                .frame(width: 100.0, height: 100.0)



        }
        .onChange(of: dataString) { newDataString in
            if let data = newDataString.data(using: .utf8),
                let string = String(data: data, encoding: .utf8) {

                qrCodeImage = generateQRCode(from: string)
            }
        }
        .onAppear {
            print("qrcodeappearin")
        }
    }
}

struct QRCode_Previews: PreviewProvider {
    
    @State static var dataString = "testing"
    
    static var previews: some View {
        QRCode(dataString: $dataString)
    }
}



func generateQRCode(from dataString: String) -> NSImage {
    let filter = CIFilter(name: "CIQRCodeGenerator")
    
    do {
        let data = dataString.data(using: .utf8)!

        filter?.setValue(data, forKey: "inputMessage")
        filter?.setValue("H", forKey: "inputCorrectionLevel") // Set error correction level

        guard let image = filter?.outputImage else {return NSImage()}
        let rep = NSCIImageRep(ciImage: image)
 

        let nsImage = NSImage()
        nsImage.addRepresentation(rep)
        nsImage.backgroundColor = .clear
        nsImage.cacheMode = .always
        return nsImage
    } catch {
        print(error.localizedDescription)
    }
    return NSImage()
    
}
