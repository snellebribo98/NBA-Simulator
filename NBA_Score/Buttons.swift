//
//  Buttons.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 24/01/2019.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//

import UIKit

class roundedButtons: UIButton {
    
    override func awakeFromNib() {
         super.awakeFromNib()
        layer.borderWidth = 1/UIScreen.main.nativeScale
        contentEdgeInsets = UIEdgeInsets(top: 1, left: 16, bottom: 0, right: 16)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height/2
        layer.borderColor = tintColor.cgColor
    }
    
}
