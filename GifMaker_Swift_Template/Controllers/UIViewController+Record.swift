//
//  UIViewController+Record.swift
//  GifMaker_Swift_Template
//
//  Created by Pete Barnes on 2/13/18.
//  Copyright © 2018 Pete Barnes. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

// Regift Constants
let frameCount = 16
let delayTime: Float = 0.2
let loopCount = 0 // 0 == Loop forever

extension UIViewController {
    
    @IBAction func launchVideoCamera (sender: AnyObject) {
        
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.mediaTypes = [kUTTypeMovie as String]
        picker.allowsEditing = false
        picker.delegate = self
        
        present(picker, animated: true, completion: nil)
        
    }
    
    // Gif conversion methods
    func convertVideoToGIF (videoURL: URL) {
        
        let regift = Regift(sourceFileURL: videoURL, destinationFileURL: nil, frameCount: frameCount, delayTime: delayTime, loopCount: loopCount)
        
        if let gifURL = regift.createGif() {
            
            let gif = Gif(url: gifURL, videoURL: videoURL, caption: nil)
            
            displayGIF(gif: gif)
        }
        
    }
    
    func displayGIF(gif: Gif) {
        
        let gifEditorVC = storyboard?.instantiateViewController(withIdentifier: "GifEditorViewController") as! GifEditorViewController
        
        gifEditorVC.gif = gif
        
        navigationController?.pushViewController(gifEditorVC, animated: true)
        
        
    }
    
}
// MARK:- UIViewController: UIImagePickerControllerDelegate

extension UIViewController: UIImagePickerControllerDelegate {
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        
        if mediaType == kUTTypeMovie as String {
            let videoURL = info[UIImagePickerControllerMediaURL] as! NSURL
            convertVideoToGIF(videoURL: videoURL as URL)
            //UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path!, nil, nil, nil)
            dismiss(animated: true, completion: nil)
        }
        
    }
}

// MARK:- UIViewController: UINavigationControllerDelegate

extension UIViewController: UINavigationControllerDelegate {
    
}
