//
//  Constants.swift
//  OnTheMap
//
//  Created by Cameron Laury on 3/21/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import Foundation
import UIKit
    
    // For a lot of this I referenced from the "Movie Manager" app
    
struct Constants {
    
    struct URLPlusAPIKey {
    
        // APIKey and Application ID
        static let APIKey = "QuWThTdiRmTux3YaDseUSEpUKo7aBYM737yKd4gY"
        static let AppID = "QrX47CA9cyuGewLdsL7o5Eb8iug6Em8ye0dnAbIr"
    
        // URL
        static let ApiScheme = "https"
        static let ApiHost = "parse.udacity.com"
        static let ApiPath = "/parse/classes"

    }
    
    struct Methods {
        
        static let AuthenticationTokenNew = "/authentication/token/new"
        static let AuthenticationSessionNew = "/authentication/session/new"
        
        static let config = "/configuration"
        static let studentLocation = "/StudentLocation"
        
    }
    
    struct Parameters {
        
        static let APIKey = "api_key"
        static let sessionID = "id"
        static let requestToken = "request_token"
        static let query = "query"
        
    }
    
    struct JSONResponseKeys {
        
        // Status
        static let statusMessage = "status_message"
        static let statusCode = "status_code"
        
        // ID/Authentication
        static let sessionID = "id"
        static let userID = "id"
        
        // Base URL
        static let ConfigBaseURL = "base_url"
        static let ConfigSecureBaseURL = "secure_base_url"
        
        // Location
        static let objectID = "objectId"
        static let uniqueKey = "uniqueKey"
        static let studentFirstName = "firstName"
        static let studentLastName = "lastName"
        static let studentMapString = "mapString"
        static let studentLongitude = "longitude"
        static let studentLatitude = "latitude"
        static let mapString = "mapString"
        static let updatedAt = "updatedAt"
        static let mediaURL = "mediaURL"
        static let key = "key"
        static let account = "account"
        static let registered = "registered"
        static let id = "id"
        static let session = "session"
        
    }
}
