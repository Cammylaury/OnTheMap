//
//  googlePlusBtn.swift
//  OnTheMap
//
//  Created by Cameron Laury on 3/24/17.
//  Copyright © 2017 Cameron Laury. All rights reserved.
//

import UIKit

class googlePlusBtn: UIButton {

    override func draw(_ rect: CGRect) {
        LogInBtnstylekit.drawGoogleCircleButton(frame: self.bounds, resizing: .aspectFit)
    }

}
