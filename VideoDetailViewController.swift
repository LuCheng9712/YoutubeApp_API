//
//  VideoDetailViewController.swift
//  YoutubeApp
//
//  Created by Lu Cheng on 2017-03-05.
//  Copyright © 2017 Lu Cheng. All rights reserved.
//

import UIKit

class VideoDetailViewController: UIViewController {
    
    @IBOutlet weak var WebView: UIWebView!
    @IBOutlet weak var TitleLabel: UILabel! 
    @IBOutlet weak var DescLabel: UILabel!
    
    
    
    var selectedVideo: Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let vid = self.selectedVideo {
            
            self.TitleLabel.text = vid.videoTitle
            self.DescLabel.text = vid.videoDescription
            
            let width = self.view.frame.size.width
            let height = width / 336 * 188
            
            let videoEmbedString = "<html><head><style type=\"text/css\">body {background-color: transparent;color: white;}</style></head><body style=\"margin:0\"><iframe frameBorder=\"0\" height=\"" + String(describing: height) + "\" width=\"" + String(describing: width) + "\" src=\"http://www.youtube.com/embed/" + vid.videoId + "?showinfo=0&modestbranding=1&frameborder=0&rel=0;vq=hd720\"></iframe></body></html>"
            
            self.WebView.loadHTMLString(videoEmbedString, baseURL: nil)
            
        }
    }
    
    
}
