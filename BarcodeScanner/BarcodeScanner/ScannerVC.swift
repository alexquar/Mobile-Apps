//
//  ScannerVC.swift
//  BarcodeScanner
//
//  Created by Alex on 2024-10-08.
//

import Foundation
import AVFoundation
import UIKit

protocol ScannerVCDelegate: AnyObject {
    func didFind(barcode:String)
}

final class ScannerVC: UIViewController {
    //capture what on camera
    let captureSession = AVCaptureSession()
    
    //preview layer
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    //delegate
    weak var scannerDelegate: ScannerVCDelegate!
    init(scannerDelegate:ScannerVCDelegate){
        super.init(nibName:nil, bundle:nil)
        self.scannerDelegate = scannerDelegate
    }
    
    required init?(coder:NSCoder){ fatalError("init(coder:) has not been implemented")}
    
    //function to get view up and running
    private func setupCaptureSession () {
        
        //check device
        guard let videoCaptureDevice = AVCaptureDevice.default(for:.video) else {
            return
        }
    
        //set video input
        let videoInput: AVCaptureDeviceInput
        
        do {
            try
            videoInput = AVCaptureDeviceInput(device:videoCaptureDevice)
        }  catch {
                return
        }
        
        //check if we can add vid input
        if captureSession.canAddInput(videoInput){
            captureSession.addInput(videoInput)
        } else {
            return
        }
        
        let metaDataOutput = AVCaptureMetadataOutput()
        
        //see if we can add output
        if captureSession.canAddOutput(metaDataOutput){
            captureSession.addOutput(metaDataOutput)
            metaDataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metaDataOutput.metadataObjectTypes = [.ean8,.ean13]
        } else {
            return
        }
        
        //set up preview layer
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        //fill the area and keep aspect ratio
        previewLayer!.videoGravity = .resizeAspectFill
        
        //add sublayer
        view.layer.addSublayer(previewLayer!)
        //start running capture session
        captureSession.startRunning()
    }
    
}

extension ScannerVC: AVCaptureMetadataOutputObjectsDelegate{
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        guard let object = metadataObjects.first else {
            return
        }
        
        guard let machineReadableObject = object as? AVMetadataMachineReadableCodeObject else {
            return
        }
        
        guard let barcode = machineReadableObject.stringValue else {
            return
        }
        
        scannerDelegate?.didFind(barcode:barcode)
                
    }
}
