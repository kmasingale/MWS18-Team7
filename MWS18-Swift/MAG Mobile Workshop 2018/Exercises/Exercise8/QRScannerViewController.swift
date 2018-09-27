//
//  QRScannerViewController.swift
//  MAG Mobile Workshop 2018
//
//  Created by Kevin Masingale on 9/26/18.
//  Copyright © 2018 CA Technologies. All rights reserved.
//

import UIKit
import AVFoundation

class QRCodeScannerViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var completionHandler:((String) -> Void)?
    var scannedCode:String?
    
    var captureDevice:AVCaptureDevice?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var captureSession:AVCaptureSession?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup UI elements
        navigationItem.title = "QR Code Scanner"
        view.backgroundColor = .white
        
        // Take an instance of the AVCaptureDevice
        captureDevice = AVCaptureDevice.default(for: .video)
        
        // Check if captureDevice returns a value and unwrap it
        if let captureDevice = captureDevice {
            
            do {
                // Get an instance of the AVCaptureDeviceInput class in order to specify an input device
                let input = try AVCaptureDeviceInput(device: captureDevice)
                
                // Initialize captureSession and assign the input device to it
                captureSession = AVCaptureSession()
                guard let captureSession = captureSession else { return }
                captureSession.addInput(input)
                
                // Create the captureMetadataOutput to intercept any metadata found in the input device
                let captureMetadataOutput = AVCaptureMetadataOutput()
                captureSession.addOutput(captureMetadataOutput)
                
                captureMetadataOutput.setMetadataObjectsDelegate(self, queue: .main)
                captureMetadataOutput.metadataObjectTypes = [.code128, .qr, .ean13,  .ean8, .code39] //AVMetadataObject.ObjectType]
                
                // Show the device camera
                videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
                videoPreviewLayer?.videoGravity = .resizeAspectFill
                videoPreviewLayer?.frame = view.layer.bounds
                view.layer.addSublayer(videoPreviewLayer!)
                
                captureSession.startRunning()
                
            } catch {
                print("Error Device Input")
            }
            
        }
        
        //  Optional, add cancel button here
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if metadataObjects.count == 0 {
            print("No Input Detected")
            return
        }
        
        let metadataObject = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        guard let stringCodeValue = metadataObject.stringValue else { return }
        
        scannedCode = stringCodeValue
        
        // Stop capturing
        captureSession?.stopRunning()
        
        // Call the function which displays the button to close the view at the end of capture
        scanCompleted()
    }
    
    lazy var scanButton:UIButton = {
        let scanButton = UIButton(type: .system)
        scanButton.setTitle("Done", for: .normal)
        scanButton.setTitleColor(.white, for: .normal)
        scanButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        scanButton.backgroundColor = .black
        scanButton.addTarget(self, action: #selector(returnScannedValueToParentView), for: .touchUpInside)
        scanButton.translatesAutoresizingMaskIntoConstraints = false
        
        return scanButton
    }()
    
    func scanCompleted() {
        view.addSubview(scanButton)
        scanButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        scanButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scanButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        scanButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
    }
    
    @objc func returnScannedValueToParentView() {
        completionHandler?(scannedCode!)
        self.dismiss(animated: false, completion: nil)
    }
}
