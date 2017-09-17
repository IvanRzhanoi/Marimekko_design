//
//  FirstViewController.swift
//  MarimekkoDesigApp
//
//  Created by Ivan Rzhanoi on 16/09/2017.
//  Copyright © 2017 Ivan Rzhanoi. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController {

    @IBOutlet weak var previewView: UIView!
    @IBOutlet weak var captureImageView: UIImageView!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var suggestionLabel: UILabel!
    @IBOutlet weak var cayenneButton: UIButton!
    @IBOutlet weak var cyanButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var whiteButton: UIButton!
    
    var cayenneButtonCenter: CGPoint!
    var cyanButtonCenter: CGPoint!
    var redButtonCenter: CGPoint!
    var yellowButtonCenter: CGPoint!
    var whiteButtonCenter: CGPoint!
    
    
    var session: AVCaptureSession?
    var stillImageOutput: AVCaptureStillImageOutput?
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        whiteButton.layer.borderWidth = 1
//        whiteButton.layer.borderColor = UIColor.black.cgColor
        
        // Setting the center points
        cayenneButtonCenter = cayenneButton.center
        cyanButtonCenter = cyanButton.center
        redButtonCenter = redButton.center
        yellowButtonCenter = yellowButton.center
        whiteButtonCenter = whiteButton.center
        
        self.cayenneButton.translatesAutoresizingMaskIntoConstraints = true
        self.cyanButton.translatesAutoresizingMaskIntoConstraints = true
        self.redButton.translatesAutoresizingMaskIntoConstraints = true
        self.yellowButton.translatesAutoresizingMaskIntoConstraints = true
        self.whiteButton.translatesAutoresizingMaskIntoConstraints = true
        
        cayenneButton.center = colorLabel.center
        cyanButton.center = suggestionLabel.center
        redButton.center = suggestionLabel.center
        yellowButton.center = suggestionLabel.center
        whiteButton.center = suggestionLabel.center
        
        
        // Do any additional setup after loading the view.
        session = AVCaptureSession()
        session!.sessionPreset = AVCaptureSession.Preset.photo
        
        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)
        
        var error: NSError?
        var input: AVCaptureDeviceInput!
        do {
            input = try AVCaptureDeviceInput(device: backCamera!)
        } catch let error1 as NSError {
            error = error1
            input = nil
            print(error!.localizedDescription)
        }
        
        if error == nil && session!.canAddInput(input) {
            session!.addInput(input)
            // ...
            // The remainder of the session setup will go here...
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey: AVVideoCodecType.jpeg]
        }
        
        if session!.canAddOutput(stillImageOutput!) {
            session!.addOutput(stillImageOutput!)
            // ...
            // Configure the Live Preview here...
            videoPreviewLayer = AVCaptureVideoPreviewLayer(session: session!)
            videoPreviewLayer!.videoGravity = AVLayerVideoGravity.resizeAspectFill//resizeAspect
            videoPreviewLayer!.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
            previewView.layer.addSublayer(videoPreviewLayer!)
            session!.startRunning()
        }
    }
    
    @IBAction func snap(_ sender: Any) {
        if let videoConnection = stillImageOutput!.connection(with: AVMediaType.video) {
            // ...
            // Code for photo capture goes here...
            stillImageOutput?.captureStillImageAsynchronously(from: videoConnection, completionHandler: { (sampleBuffer, error) -> Void in
                // ...
                // Process the image data (sampleBuffer) here to get an image file we can put in our captureImageView
                if sampleBuffer != nil {
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer!)
                    let dataProvider = CGDataProvider(data: imageData! as CFData)
                    let cgImageRef = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.defaultIntent)
                    let image = UIImage(cgImage: cgImageRef!, scale: 1.0, orientation: UIImageOrientation.right)
                    // ...
                    // Add the image to captureImageView here...
                    self.captureImageView.image = image
                }
            })
            session?.stopRunning()
            
        }
        
        UIView.animate(withDuration: 1.0, animations: {
            self.previewView.alpha = 0.0
            self.captureImageView.alpha = 1.0
        })
        
        UIView.animate(withDuration: 0.3, animations: {
            self.colorLabel.alpha = 1
            self.suggestionLabel.alpha = 1
            self.cayenneButton.alpha = 1
            self.cyanButton.alpha = 1
            self.redButton.alpha = 1
            self.yellowButton.alpha = 1
            self.whiteButton.alpha = 1
            

            self.cayenneButton.center = self.cayenneButtonCenter
            self.cyanButton.center = self.cyanButtonCenter
            self.redButton.center = self.redButtonCenter
            self.yellowButton.center = self.yellowButtonCenter
            self.whiteButton.center = self.whiteButtonCenter
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Setup your camera here...
        videoPreviewLayer!.frame = previewView.bounds
    }


}

