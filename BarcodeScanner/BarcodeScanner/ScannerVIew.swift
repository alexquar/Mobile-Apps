//
//  ScannerVIew.swift
//  BarcodeScanner
//
//  Created by Alex on 2024-10-10.
//

import SwiftUI

struct ScannerVIew: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ScannerVC {
        ScannerVC(scannerDelegate: context.coordinator)
    }
    
    func updateUIViewController(_ uiViewController: ScannerVC, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    final class Coordinator: NSObject, ScannerVCDelegate{
        func didFind(barcode: String) {
            print(barcode)
        }
        
        func didSurface(error: cameraError) {
            print(error.rawValue)
        }
    }
}

#Preview {
    ScannerVIew()
}
