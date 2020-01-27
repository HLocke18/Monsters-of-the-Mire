//
//  EnemyViewController.swift
//  Other Side Project
//
//  Created by  on 5/24/19.
//  Copyright © 2019 Hayley's Apps. All rights reserved.
//

import UIKit

class EnemyViewController: UIViewController
{

    var character = String()
    var enemy = String()
    var player = Player()
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
    }
    
    @IBAction func easyButtonTapped(_ sender: UIButton)
    {
        
    }
    
    @IBAction func normalButtonTapped(_ sender: UIButton)
    {
        
    }
    
    @IBAction func hardButtonTapped(_ sender: UIButton)
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "EasySegue"
        {
            let enemyInfoVC = segue.destination as! EnemyInfoViewController
            enemyInfoVC.enemy = "Enemy 2"
            
            if character == "Character 1"
            {
                enemyInfoVC.character = "Character 1"
            }
            else if character == "Character 2"
            {
                enemyInfoVC.character = "Character 2"
            }
            else if character == "Character 3"
            {
                enemyInfoVC.character = "Character 3"
            }
            else if character == "Character 4"
            {
                enemyInfoVC.character = "Character 4"
            }
        }
        else if segue.identifier == "NormalSegue"
        {
            let enemyInfoVC = segue.destination as! EnemyInfoViewController
            enemyInfoVC.enemy = "Enemy 1"
            
            if character == "Character 1"
            {
                enemyInfoVC.character = "Character 1"
            }
            else if character == "Character 2"
            {
                enemyInfoVC.character = "Character 2"
            }
            else if character == "Character 3"
            {
                enemyInfoVC.character = "Character 3"
            }
            else if character == "Character 4"
            {
                enemyInfoVC.character = "Character 4"
            }
        }
        else if segue.identifier == "HardSegue"
        {
            let enemyInfoVC = segue.destination as! EnemyInfoViewController
            enemyInfoVC.enemy = "Enemy 3"
            
            if character == "Character 1"
            {
                enemyInfoVC.character = "Character 1"
            }
            else if character == "Character 2"
            {
                enemyInfoVC.character = "Character 2"
            }
            else if character == "Character 3"
            {
                enemyInfoVC.character = "Character 3"
            }
            else if character == "Character 4"
            {
                enemyInfoVC.character = "Character 4"
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
