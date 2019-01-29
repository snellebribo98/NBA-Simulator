//
//  RosterCell.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 21/01/2019.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//
//  This class servers as the outlet for the labels in the roster tableview


import UIKit

class RosterCell: UITableViewCell {
    /// outlets
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var commaLabel: UILabel!
}
