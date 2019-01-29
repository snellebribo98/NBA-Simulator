//
//  Buttons.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 24/01/2019.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//
// This class can give a specific layout to buttons.


import UIKit

class roundedButtons: UIButton {
    /// func is called when object is created
    /// sets the border width
    /// creates padding on the left and right side
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 1/UIScreen.main.nativeScale
        contentEdgeInsets = UIEdgeInsets(top: 1, left: 16, bottom: 0, right: 16)
    }
    
    /// updates the corner radius which makes the corners round
    /// sets tintcolor of border to text color
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2
        layer.borderColor = tintColor.cgColor
    }
}
