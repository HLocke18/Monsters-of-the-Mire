//
//  EnemyInfoViewController.swift
//  Other Side Project
//
//  Created by  on 5/24/19.
//  Copyright © 2019 Hayley's Apps. All rights reserved.
//

import UIKit

class EnemyInfoViewController: UIViewController
{

    
    @IBOutlet weak var enemyImageView: UIImageView!
    @IBOutlet weak var enemyNameLabel: UILabel!
    @IBOutlet weak var enemyDescriptionLabel: UILabel!
    
    var character = String()
    var enemy = String()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        customizeViews()
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton)
    {
        
    }
    
    func customizeViews()
    {
        if enemy == "Enemy 2"
        {
            enemyImageView.backgroundColor = UIColor.blue
            enemyNameLabel.text = "Bunn"
            enemyDescriptionLabel.text = ""
        }
        else if enemy == "Enemy 1"
        {
            enemyImageView.backgroundColor = UIColor.green
            enemyNameLabel.text = "Flux"
            enemyDescriptionLabel.text = ""
        }
        else if enemy == "Enemy 3"
        {
            enemyImageView.backgroundColor = UIColor.black
            enemyNameLabel.text = "Grimoire"
            enemyDescriptionLabel.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "YesSegue"
        {
            let secondVC = segue.destination as! SecondViewController
            
            if enemy == "Enemy 2"
            {
                secondVC.enemy = "Enemy 2"
            }
            else if enemy == "Enemy 1"
            {
                secondVC.enemy = "Enemy 1"
            }
            else if enemy == "Enemy 3"
            {
                secondVC.enemy = "Enemy 3"
            }
            
            if character == "Character 1"
            {
                secondVC.character = "Character 1"
            }
            else if character == "Character 2"
            {
                secondVC.character = "Character 2"
            }
            else if character == "Character 3"
            {
                secondVC.character = "Character 3"
            }
            else if character == "Character 4"
            {
                secondVC.character = "Character 4"
            }
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
