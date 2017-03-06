//
//  ViewController.swift
//  YoutubeApp
//
//  Created by Lu Cheng on 2017-03-05.
//  Copyright © 2017 Lu Cheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var videos: [Video] = [Video]()
    
    var selectedVideo: Video?
    
    let model: VideoModel = VideoModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.model.delegate = self
        
        //self.videos = VideoModel().getVideos()
        
        VideoModel().getFeedVideos()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func dataReady() {
        
        self.videos = self.model.videoArray
        self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // Get the width of the screen to calculate the height of the cell
        return ((self.view.frame.size.width / 320) * 180 + 50)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicCell")!
        
        // Get Label
        
        let titleLabel = cell.viewWithTag(2) as! UILabel
        titleLabel.text = videos[indexPath.row].videoTitle
        
        // Construct the video thumbnail URL
        let id = videos[indexPath.row].videoId
        let videoTnURLString = videos[indexPath.row].videoTnURL 
        
        // Create an NSURL object
        let videoTnURL = NSURL(string: videoTnURLString)
        
        if videoTnURL != nil {
            
            // Pass an NSURLRequest Object
            let request = URLRequest(url: videoTnURL as! URL)
            
            // Create an NSURLSession
            let session = URLSession.shared
            
            // Create a datatask and pass in the request
            let dataTask = session.dataTask(with: request, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) in
            
                
                
                DispatchQueue.main.async(execute: { 
                    
                    // Get a reference to the imageView element of the cell
                    let imageView = cell.viewWithTag(1) as! UIImageView
                    
                    // Create an image object from the data and assigns it into the imageview
                    imageView.image = UIImage(data: data!)
                    
                })
                
            })
            
            dataTask.resume()
            
        }

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Take note of which video the user selected
        self.selectedVideo = self.videos[indexPath.row]
        
        // Call the seque
        self.performSegue(withIdentifier: "goToDetail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get a reference to the destination view controller
        let detailViewController = segue.destination as! VideoDetailViewController
        
        // Set the selected video property of the destination view controller
        detailViewController.selectedVideo = self.selectedVideo
        
    }
    
}















