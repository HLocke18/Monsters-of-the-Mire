//
//  CharInfoViewController.swift
//  Other Side Project
//
//  Created by  on 5/1/19.
//  Copyright © 2019 Hayley's Apps. All rights reserved.
//

import UIKit

class CharInfoViewController: UIViewController
{

    @IBOutlet weak var myCharacterImage: UIImageView!
    @IBOutlet weak var charDescriptionLabel: UILabel!
    @IBOutlet weak var charNameLabel: UILabel!
    
    var character = String()
    var player = Player()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        customizeViews()
    }
    
    func customizeViews()
    {
        myCharacterImage.backgroundColor = player.color
        charNameLabel.text = player.name
        charDescriptionLabel.text = player.description
        
//        if character == "Character 1"
//        {
//            myCharacterImage.backgroundColor = UIColor.yellow
//            charNameLabel.text = "Lorde"
//            charDescriptionLabel.text = ""
//        }
//        else if character == "Character 2"
//        {
//            myCharacterImage.backgroundColor = UIColor.purple
//            charNameLabel.text = "Skel"
//            charDescriptionLabel.text = ""
//        }
//        else if character == "Character 3"
//        {
//            myCharacterImage.backgroundColor = UIColor.red
//            charNameLabel.text = "Ignus"
//            charDescriptionLabel.text = ""
//        }
//        else if character == "Character 4"
//        {
//            myCharacterImage.backgroundColor = UIColor.green
//            charNameLabel.text = "Merrick"
//            charDescriptionLabel.text = ""
//        }
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton)
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "YesSegue"
        {
            let enemyVC = segue.destination as! EnemyViewController
            let player = self.player
//            enemyVC.
//            if character == "Character 1"
//            {
//                enemyVC.character = "Character 1"
//            }
//            else if character == "Character 2"
//            {
//                enemyVC.character = "Character 2"
//            }
//            else if character == "Character 3"
//            {
//                enemyVC.character = "Character 3"
//            }
//            else if character == "Character 4"
//            {
//                enemyVC.character = "Character 4"
//            }
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
