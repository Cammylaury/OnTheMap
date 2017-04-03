//
//  Convenience.swift
//  OnTheMap
//
//  Created by Cameron Laury on 3/26/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import Foundation

extension Constants {
    
    func logout(handler: @escaping(_ response: Bool, _ error: String?) -> Void) {
        
        let parameters = [String:AnyObject]()
        let urlRequest = UdacityClient.URLParameters(parameters: parameters, withPathExtension: "/api/session", withHost: Constants.URLPlusAPIKey.ApiHost)
        
    }
}
