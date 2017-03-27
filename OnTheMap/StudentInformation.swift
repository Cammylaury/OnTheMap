//
//  StudentInformation.swift
//  OnTheMap
//
//  Created by Cameron Laury on 3/23/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import Foundation
import UIKit

struct StudentInformation {
    
    let objectID: String?
    let uniqueKey: String?
    let firstName: String?
    let lastName: String?
    let mapString: String?
    let mediaURL: String?
    let latitude: Float?
    let longitude: Float?
    let updatedAt: String?
    
    static var arrayOfStudents: [StudentInformation] = []
    
    // Dictionary of students
    init(dictionary: [String:AnyObject]) {
        
        objectID = dictionary[Constants.JSONResponseKeys.objectID] as? String
        uniqueKey = dictionary[Constants.JSONResponseKeys.uniqueKey] as? String
        firstName = dictionary[Constants.JSONResponseKeys.studentFirstName] as? String
        lastName = dictionary[Constants.JSONResponseKeys.studentLastName] as? String
        mapString = dictionary[Constants.JSONResponseKeys.mapString] as? String
        mediaURL = dictionary[Constants.JSONResponseKeys.mediaURL] as? String
        latitude = dictionary[Constants.JSONResponseKeys.studentLatitude] as? Float
        longitude = dictionary[Constants.JSONResponseKeys.studentLongitude] as? Float
        updatedAt = dictionary[Constants.JSONResponseKeys.updatedAt] as? String
        
    }
    
    static func getLocationFromResults(_ result: [[String:AnyObject]]) -> [StudentInformation] {
        var studentLocation = [StudentInformation]()
        
        for result in result {
            studentLocation.append(StudentInformation(dictionary:result))
        }
        
        return studentLocation
    }
    
}
