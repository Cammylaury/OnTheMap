//
//  GCDBlackBox.swift
//  OnTheMap
//
//  Created by Cameron Laury on 3/21/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}
