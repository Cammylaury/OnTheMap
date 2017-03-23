//
//  UdacityClient.swift
//  OnTheMap
//
//  Created by Cameron Laury on 3/22/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit
import Foundation

class UdacityClient: NSObject {
    
    var sessionID: String? = nil
    
    var session = URLSession.shared
    
    var userID: String? = nil
    
    override init() {
        super.init()
    }

}
