//
//  UdacityClient.swift
//  OnTheMap
//
//  Created by Cameron Laury on 3/22/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit
import Foundation

class UdacityClient: NSObject, MKMapViewDelegate {
    
    var sessionID: String? = nil
    
    var session = URLSession.shared
    
    var userID: String? = nil
    
    override init() {
        super.init()
    }
    
    // Step 2/3: URL and request
    func URLParameters(parameters: [String:AnyObject], pathExtensions: String? = nil, host: String? = nil) -> URL {
        
        var components = URLComponents()
        components.scheme = Constants.URLPlusAPIKey.ApiScheme
        components.host = host!
        components.path = pathExtensions!
        components.queryItems = [URLQueryItem]()
        
        for (key, value) in parameters {
            let queryItem = URLQueryItem(name: key, value: "\(value)")
            components.queryItems!.append(queryItem)
        }
        
        return components.url!
        
    }
    // Step 2/3:
    // Parsing le JSON... I had to reference someone else's code for this. I used some from the MyFavoriteMovies app and someone elses repository. I do not know if this is the proper way to cite someone else's code. I am trying to give proper credit. I did however change it to my needs. The github repo I referenced was this: https://github.com/eric220/OnTheMap
    
    func convertDataWithCompletionHandler(_ data: Data, completionHandler: (_ result: AnyObject?, _ error: NSError?) -> Void) {
        
        var parsedResult: AnyObject! = nil
        do {
            parsedResult = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as AnyObject
        } catch {
            let userInfo = [NSLocalizedDescriptionKey : "Could not parse the JSON: '\(data)'"]
            completionHandler(nil, NSError(domain: "convertDataWithCompletionHandler", code: 1, userInfo: userInfo))
        }
        
        completionHandler(parsedResult, nil)
    }
    
    func authenticateWithUdacity(email: String, password: String, loginWithDataHandler: @escaping(_ success: Bool, _ error: String?) -> Void) {
        
        self.login(email: email, password: password) {
            (success, error) in
            
            if (success) {
                self.getUserData() {
                    
                    (success, error) in
                    loginWithDataHandler(success, error)
                    
                }
            } else {
                
                loginWithDataHandler(success, error)
            }
            
        }
        
    }
}
