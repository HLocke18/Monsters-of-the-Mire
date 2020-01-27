//
//  CharacterViewController.swift
//  Other Side Project
//
//  Created by  on 5/1/19.
//  Copyright © 2019 Hayley's Apps. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController
{

    override func viewDidLoad()
    {
        
        super.viewDidLoad()
    }
    
    @IBAction func defaultButtonTapped(_ sender: UIButton)
    {
        
    }
    @IBAction func magicButtonTapped(_ sender: UIButton)
    {
        
    }
    @IBAction func strongButtonTapped(_ sender: UIButton)
    {
        
    }
    @IBAction func balancedButtonTapped(_ sender: UIButton)
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "DefaultSegue"
        {
            let charInfoVC = segue.destination as! CharInfoViewController
            let player = Player(n: "Lorde", a: 15, sa: 20, h: 100, d: 0, sd: 5, c: UIColor.yellow, des: "")
            charInfoVC.player = player
            //charInfoVC.character = "Character 1"
        }
        else if segue.identifier == "MagicSegue"
        {
            let charInfoVC = segue.destination as! CharInfoViewController
            let player = Player(n: "Skel", a: 5, sa: 30, h: 80, d: 0, sd: 15, c: UIColor.purple, des: "")
            charInfoVC.player = player
            //charInfoVC.character = "Character 2"
        }
        else if segue.identifier == "StrongSegue"
        {
            let charInfoVC = segue.destination as! CharInfoViewController
            let player = Player(n: "Ignus", a: 30, sa: 5, h: 110, d: 5, sd: 0, c: UIColor.red, des: "")
            charInfoVC.player = player
            //charInfoVC.character = "Character 3"
        }
        else if segue.identifier == "BalancedSegue"
        {
            let charInfoVC = segue.destination as! CharInfoViewController
            let player = Player(n: "Merrick", a: 20, sa: 20, h: 90, d: 0, sd: 0, c: UIColor.green, des: "")
            charInfoVC.player = player
            //charInfoVC.character = "Character 4"
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
