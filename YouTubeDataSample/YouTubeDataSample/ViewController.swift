//
//  ViewController.swift
//  YouTubeDataSample
//
//  Created by Teruhiro Matsukawa on 2018/06/21.
//  Copyright © 2018年 Teruhiro Matsukawa. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController
{
    /// YouTube API Data v3
    fileprivate let apiKey = "YOUR API KEY"
    
    @IBOutlet weak var channelTextField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    fileprivate func getChannelData(success: @escaping (NSDictionary) -> (), failed: @escaping (String) -> ())
    {
        let channelId = channelTextField.text ?? ""
        
        if channelId.isEmpty
        {
            print("input channnel id")
            return
        }
        
        let url = "https://www.googleapis.com/youtube/v3/channels?part=statistics&id=\(channelId)&key=\(apiKey)"
        let parameters: [String : Any] = [:]
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in

            if let error = response.error
            {
                failed(error.localizedDescription)
                return
            }
            
            let result = response.result.value as! NSDictionary
            success(result)
        }
    }
    
    fileprivate func getPlaylist(success: @escaping (NSDictionary) -> (), failed: @escaping (String) -> ())
    {
        let channelId = channelTextField.text ?? ""
        
        if channelId.isEmpty
        {
            print("input channnel id")
            return
        }
        
        let url = "https://www.googleapis.com/youtube/v3/playlists?part=id,snippet,status&channelId=\(channelId)&key=\(apiKey)"
        let parameters: [String : Any] = [:]
        
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in
            
            if let error = response.error
            {
                failed(error.localizedDescription)
                return
            }
            
            let result = response.result.value as! NSDictionary
            success(result)
        }
    }
    
    @IBAction func tapRequestChannelInfo(_ sender: Any)
    {
        channelTextField.endEditing(true)

        getChannelData(success: { result in
            print(result)
        }) { errorMessage in
            print(errorMessage)
        }
    }
    
    @IBAction func tapRequestPlaylist(_ sender: Any)
    {
        channelTextField.endEditing(true)
        
        getPlaylist(success: { result in
            print(result)
        }) { errorMessage in
            print(errorMessage)
        }
    }
}

extension ViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.endEditing(true)

        getChannelData(success: { result in
            print(result)
        }) { errorMessage in
            print(errorMessage)
        }

        return true
    }
}
