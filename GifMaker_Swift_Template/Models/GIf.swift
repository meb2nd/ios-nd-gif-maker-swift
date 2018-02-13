//
//  GIf.swift
//  GifMaker_Swift_Template
//
//  Created by Pete Barnes on 2/13/18.
//  Copyright © 2018 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class Gif: NSObject {
    
    let url: URL?
    let videoURL: URL?
    let caption: String?
    let gifImage: UIImage?
    var gifData: NSData?
    
    init(url: URL, videoURL: URL, caption: String?) {
        
        self.url = url
        self.videoURL = videoURL
        self.caption = caption
        self.gifImage = UIImage.gif(url: url.absoluteString)!
        self.gifData = nil
    }
    
    init(name: String){
        self.url = nil
        self.videoURL = nil
        self.caption = nil
        self.gifImage = UIImage.gif(name: name)
    }
}
