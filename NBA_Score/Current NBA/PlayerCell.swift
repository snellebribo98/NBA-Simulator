//
//  PlayerCell.swift
//  NBA_Score
//
//  Created by Brian van de Velde on 10-01-19.
//  Copyright © 2019 Brian van de Velde. All rights reserved.
//
//  This class servers as the outlet for the labels in the player tableview


import UIKit


class PlayerCell: UITableViewCell {
    /// outlets
    @IBOutlet weak var playerLastLabel: UILabel!
    @IBOutlet weak var playerFirstLabel: UILabel!
    @IBOutlet weak var commaLabel: UILabel!
}
