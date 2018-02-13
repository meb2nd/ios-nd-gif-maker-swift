//
//  GifEditorViewController.swift
//  GifMaker_Swift_Template
//
//  Created by Pete Barnes on 2/13/18.
//  Copyright © 2018 Gabrielle Miller-Messner. All rights reserved.
//

import UIKit

class GifEditorViewController: UIViewController {

    
    //MARK:- Outlets
    
    @IBOutlet weak var gifImageView: UIImageView!
    
    @IBOutlet weak var captionTextField: UITextField!
    
    //MARK:- Properties
    
    var gif: Gif? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        if let gif = gif,
            let url = gif.url {
            
            let image = UIImage.gif(url: url.absoluteString)
            gifImageView.image = image
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
