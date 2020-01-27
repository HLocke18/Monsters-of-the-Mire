//
//  Player.swift
//  Other Side Project
//
//  Created by  on 4/15/19.
//  Copyright © 2019 Hayley's Apps. All rights reserved.
//

import Foundation
import UIKit
class Player
{
    var name = ""
    var attack = 0
    var specialAttack = 0
    var health = 0
    var defense = 0
    var specialDefense = 0
    var color: UIColor = UIColor.white
    var description = ""
    init()
    {
        name = "Default"
        attack = 10
        specialAttack = 20
        health = 100
        defense = 5
        specialDefense = 5
        color = UIColor.yellow
        description = "Default"
    }
    init(n:String, a:Int, sa:Int, h:Int, d: Int, sd: Int, c: UIColor, des: String)
    {
        name = n
        attack = a
        specialAttack = sa
        health = h
        defense = d
        specialDefense = sd
        color = c
        description = des
    }
    
    init(n:String, a:Int, sa:Int, h:Int, d: Int, sd: Int, c: UIColor)
    {
        name = n
        attack = a
        specialAttack = sa
        health = h
        defense = d
        specialDefense = sd
        color = c
        description = "hello"
    }
    
    
    
}
