//
//  ChannelDetailViewController.swift
//  YouTubeDataSample
//
//  Created by Teruhiro Matsukawa on 2018/06/21.
//  Copyright © 2018年 Teruhiro Matsukawa. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ChannnelDetailViewController: UIViewController
{
    var responseJson: NSDictionary?
    @IBOutlet weak var responseTextView: UITextView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        guard let response = responseJson else
        {
            print("no data.")
            return
        }
        
        responseTextView.text = response as! String
    }
}
