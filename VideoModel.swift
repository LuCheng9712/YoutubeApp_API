 //
//  VideoModel.swift
//  YoutubeApp
//
//  Created by Lu Cheng on 2017-03-05.
//  Copyright © 2017 Lu Cheng. All rights reserved.
//

import UIKit
import Alamofire
 
 protocol VideoMoldelDelegate {
    func dataready()
 }

class VideoModel: NSObject {
    
    func getFeedVideos() {
        
        let URL = "https://www.googleapis.com/youtube/v3/playlistItems"
        let API_KEY = "AIzaSyCcuMOVa3kh3ibjf9PZjkL4Rv1J94LAWDs"
        let RELOADED_MV = "PLWbD7020KLkU0bGeQh91ZbyxYEVHJLwdv"
        //let LUHAN_XXV = "PLWbD7020KLkW-3G4OcyVcwW0fDAy631u1"
        
        let PARAM = ["part": "snippet", "id": RELOADED_MV, "key": API_KEY]
        
        var videoArray = [Video]()
        
        var delegate: VideoMoldelDelegate? 
        
        // Fetch the videos dynamically through Youtube Data API
        Alamofire.request(URL, method: .get, parameters: PARAM, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) -> Void in
            
            if let JSON = response.result.value {
                
                var arrayOfVideos = [Video]()
                
                for video in JSON["items"] as! NSArray {
                    print(video)
    
                    let videoObj = Video()
                    videoObj.videoId = video.valueForKeyPath("snippet.resources.videoId") as! String
                    videoObj.videoTitle = video.valueForKeyPath("snippet.title") as! String
                    videoObj.videoDescription = video.valueForKeyPath("snippet.description") as! String
                    videoObj.videoTnURL = video.valueForKeyPath("snippet.thumbnails.maxres.url") as! String
                    
                    arrayOfVideos.append(videoObj)
                }
               
                self.videoArray = arrayOfVideos
                
                if self.delegate != nil {
                    delegate!.dataready()
                }
                
            }
        }
    

        
    }

    func getVideos() -> [Video]{
        
        var videos = [Video]()
        
        // Create a video project
        
        let video1 = Video()
        let video2 = Video()
        let video3 = Video()
        let video4 = Video()
        let video5 = Video()
        let video6 = Video()
        let video7 = Video()
        let video8 = Video()
        let video9 = Video()
        let video10 = Video()
        let video11 = Video()
        
        // Assign properties
        
        video1.videoId = "bcHsWONb27o"
        video1.videoTitle = "Catch Me When I Fall"
        video1.videoDescription = "Luhan: Catch Me When I Fall - Offical MV"
        
        video2.videoId = "OF5WnhcZnFU"
        video2.videoTitle = "Medals"
        video2.videoDescription = "Luhan: Medals - Official MV"
        
        video3.videoId = "hbckGgKwnxQ"
        video3.videoTitle = "Medals V2"
        video3.videoDescription = "Luhan: Medals V2.0 - Official MV"
        
        video4.videoId = "vgU9FVP_NUo"
        video4.videoTitle = "Football Gang"
        video4.videoDescription = "Luhan: Football Gang - Official MV"
        
        video5.videoId = "AbCU00-3qQk"
        video5.videoTitle = "Excited"
        video5.videoDescription = "Luhan: Excited - Official MV"
        
        video6.videoId = "ObT9fu3SRTM"
        video6.videoTitle = "Time Traveller"
        video6.videoDescription = "Luhan: Time Traveller - Official MV"
        
        video7.videoId = "G6zaUvf7YWk"
        video7.videoTitle = "Winter Song"
        video7.videoDescription = "Luhan: Winter Song - Official MV"
        
        video8.videoId = "tqzaWJ0O19M"
        video8.videoTitle = "Role-play"
        video8.videoDescription = "Luhan: Role-play - Official MV Story Version"
        
        video9.videoId = "4EAEchM9M8M"
        video9.videoTitle = "WHAT IF I SAID"
        video9.videoDescription = "Luhan: WHAT IF I SAID - Official MV"
        
        video10.videoId = "k-ClDP2qXSg"
        video10.videoTitle = "Football Gang - Dance Version"
        video10.videoDescription = "Luhan: Football Gang - Official MV Dance Version"
        
        video11.videoId = "ynjOTMrO_X8"
        video11.videoTitle = "Skin to Skin"
        video11.videoDescription = "Luhan: Skin to Skin - Official MV"
        
        // Append it into the video arrays
        
        videos.append(video1)
        videos.append(video2)
        videos.append(video3)
        videos.append(video4)
        videos.append(video5)
        videos.append(video6)
        videos.append(video7)
        videos.append(video8)
        videos.append(video9)
        videos.append(video10)
        videos.append(video11)
        
        // Return the array to the caller
        
        return videos
        
    }
    
}
