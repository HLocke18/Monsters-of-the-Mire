//
//  SecondViewController.swift
//  Other Side Project
//
//  Created by  on 3/28/19.
//  Copyright © 2019 Hayley's Apps. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{
    //issues:
    //Using your ordinary attack to damage enemies works out fine
    //Using your special attack, however, is buggy
    //Sometimes an enemy will lose the wrong amount of health, I originally thought this was an issue with the label displaying their health, but it instead has to do with how much health they lose to begin with
    //This occurs in the following situations:
    //Lorde(player1) against Bunn(enemy2) - Enemy should lose 15 health, but instead loses 30. After enemy raises its special defense, enemy should lose 10 health, but instead loses 25.
    //Lorde(player1) against Flux(enemy1) - Enemy should lose 10 health, but instead loses 20. After enemy raises its special defense, enemy should lose 5 health, but instead loses 15.
    //Lorde(player1) against Grimoire(enemy3) - Enemy should lose 15 health, but instead loses 20. After enemy raises its special defense, enemy should lose 10 health, but instead loses 15.
    //Skel(player2) against Bunn(enemy2) - Enemy should lose 25 health, but instead loses 30. After enemy raises its special defense, enemy should lose 20 health, but instead loses 25.
    //Skel(player2) against Flux(enemy1) is without issue
    //Skel(player2) against Grimoire(enemy3) is without issue
    //Ignus(player3) against Bunn(enemy2) - Enemy should lose 0 health, but instead loses 30. After enemy raises its special defense, enemy should lose 0 health, but instead loses 30.
    //Ignus(player3) against Flux(enemy1) - Enemy should lose 0 health but instead loses 25.
    
    @IBOutlet weak var playerImage: UIImageView!
    @IBOutlet weak var enemyImage: UIImageView!
    @IBOutlet weak var playerDamageLabel: UILabel!
    @IBOutlet weak var enemyDamageLabel: UILabel!
    @IBOutlet weak var exclamationLabel: UILabel!
    @IBOutlet weak var playerHealthLabel: UILabel!
    @IBOutlet weak var enemyHealthLabel: UILabel!
    
    var player: Player = Player()
    var enemyA: Player = Player()
    var player1: Player = Player()
    var player2: Player = Player()
    var player3: Player = Player()
    var player4: Player = Player()
    var enemy1: Player = Player()
    var enemy2: Player = Player()
    var enemy3: Player = Player()
    
    var character = String()
    var enemy = String()
    
    override func viewDidLoad()
    {
        player1 = Player(n: "Lorde", a: 15, sa: 20, h: 100, d: 0, sd: 5, c: UIColor.yellow)
        player2 = Player(n: "Skel", a: 5, sa: 30, h: 80, d: 0, sd: 15, c: UIColor.purple)
        player3 = Player(n: "Ignus", a: 30, sa: 5, h: 110, d: 5, sd: 0, c: UIColor.red)
        player4 = Player(n: "Merrick", a: 20, sa: 20, h: 90, d: 0, sd: 0, c: UIColor.green)
        enemy1 = Player(n: "Flux", a: 10, sa: 25, h: 120, d: 5, sd: 10, c: UIColor.green)
        enemy2 = Player(n: "Bunn", a: 5, sa: 10, h: 75, d: 0, sd: 5, c: UIColor.blue)
        enemy3 = Player(n: "Grimoire", a: 25, sa: 20, h: 140, d: 10, sd: 5, c: UIColor.black)
        playerDamageLabel.text = ""
        enemyDamageLabel.text = ""
        exclamationLabel.text = "What will you do?"
        super.viewDidLoad()
        customizeViews()
    }
    
    func customizeViews()
    {
        if character == "Character 1"
        {
            playerImage.backgroundColor = UIColor.yellow
            playerHealthLabel.text = String(player1.health)
        }
        else if character == "Character 2"
        {
            playerImage.backgroundColor = UIColor.blue
            playerHealthLabel.text = String(player2.health)
        }
        else if character == "Character 3"
        {
            playerImage.backgroundColor = UIColor.red
            playerHealthLabel.text = String(player3.health)
        }
        else if character == "Character 4"
        {
            playerImage.backgroundColor = UIColor.green
            playerHealthLabel.text = String(player4.health)
        }
        
        if enemy == "Enemy 1"
        {
            enemyImage.backgroundColor = UIColor.green
            enemyHealthLabel.text = String(enemy1.health)
        }
        else if enemy == "Enemy 2"
        {
            enemyImage.backgroundColor = UIColor.blue
            enemyHealthLabel.text = String(enemy2.health)
        }
        else if enemy == "Enemy 3"
        {
            enemyImage.backgroundColor = UIColor.black
            enemyHealthLabel.text = String(enemy3.health)
        }
    }
    func attackHappened(attacker: Player, target: Player, damageLabel: UILabel)
    {
        damageLabel.text = "-\(attacker.attack - target.defense)"
        target.health -= attacker.attack - target.defense
//        healthLabel.text = "\(target.health)"
    }
//    func attackHappened(attacker: Player, target: Player, damageLabel: UILabel, healthLabel: UILabel)
//    {
//        damageLabel.text = "-\(attacker.attack - target.defense)"
//        target.health -= attacker.attack - target.defense
//        healthLabel.text = "\(target.health)"
//    }
    
    func specialAttackHappened(attacker: Player, target: Player, damageLabel: UILabel)
    {
        damageLabel.text = "-\(attacker.specialAttack - target.specialDefense)"
        target.health -= attacker.specialAttack - target.specialDefense
//        healthLabel.text = "\(target.health)"
    }
    
//    func specialAttackHappened(attacker: Player, target: Player, damageLabel: UILabel, healthLabel: UILabel)
//    {
//        damageLabel.text = "-\(attacker.specialAttack - target.specialDefense)"
//        target.health -= attacker.specialAttack - target.specialDefense
//        healthLabel.text = "\(target.health)"
//    }
    
    @IBAction func attackTapped(_ sender: UIButton)
    {
        if enemy == "Enemy 1"
        {
            if character == "Character 1"
            {
                    attackHappened(attacker: player1, target: enemy1, damageLabel: enemyDamageLabel)
//                attackHappened(attacker: player1, target: enemy1, damageLabel: enemyDamageLabel, healthLabel: enemyHealthLabel)
//                enemyHealthLabel.text = String(enemy1.health)
            }
            else if character == "Character 2"
            {
                enemyDamageLabel.text = "-0"
                enemy1.health -= 0
                enemyHealthLabel.text = String(enemy1.health)
            }
            else if character == "Character 3"
            {
                attackHappened(attacker: player3, target: enemy1, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy1.health)
            }
            else if character == "Character 4"
            {
                attackHappened(attacker: player4, target: enemy1, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy1.health)
            }
        }
        else if enemy == "Enemy 2"
        {
            if character == "Character 1"
            {
                attackHappened(attacker: player1, target: enemy2, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy2.health)
            }
            else if character == "Character 2"
            {
                attackHappened(attacker: player2, target: enemy2, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy2.health)
            }
            else if character == "Character 3"
            {
                attackHappened(attacker: player3, target: enemy2, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy2.health)
            }
            else if character == "Character 4"
            {
                attackHappened(attacker: player4, target: enemy2, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy2.health)
            }
        }
        else if enemy == "Enemy 3"
        {
            if character == "Character 1"
            {
                attackHappened(attacker: player1, target: enemy3, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy3.health)
            }
            else if character == "Character 2"
            {
                enemyDamageLabel.text = "-0"
                enemy3.health -= 0
                enemyHealthLabel.text = String(enemy3.health)
            }
            else if character == "Character 3"
            {
                attackHappened(attacker: player3, target: enemy3, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy3.health)
            }
            else if character == "Character 4"
            {
                attackHappened(attacker: player4, target: enemy3, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy3.health)
            }
        }
        enemyDamageLabel.textColor = UIColor.red
        exclamationLabel.text = "You attacked!"
        UIView.animate(withDuration: 0.3)
        {
            self.playerImage.frame = CGRect(x: 46, y: 283, width: 100, height: 100)
        }
    }
    
    @IBAction func specialAttackTapped(_ sender: UIButton)
    {
        if enemy == "Enemy 1"
        {
            if character == "Character 1"
            {
                specialAttackHappened(attacker: player1, target: enemy1, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy1.health)
            }
            else if character == "Character 2"
            {
                specialAttackHappened(attacker: player2, target: enemy1, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy1.health)
            }
            else if character == "Character 3"
            {
                enemyDamageLabel.text = "-0"
                enemy1.health -= 0
                enemyHealthLabel.text = String(enemy1.health)
            }
            else if character == "Character 4"
            {
                specialAttackHappened(attacker: player4, target: enemy1, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy1.health)
            }
        }
        else if enemy == "Enemy 2"
        {
            if character == "Character 1"
            {
                specialAttackHappened(attacker: player1, target: enemy2, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy2.health)
            }
            else if character == "Character 2"
            {
                specialAttackHappened(attacker: player2, target: enemy2, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy2.health)
            }
            else if character == "Character 3"
            {
                enemyDamageLabel.text = "-0"
                enemy2.health -= 0
                enemyHealthLabel.text = String(enemy2.health)
            }
            else if character == "Character 4"
            {
                specialAttackHappened(attacker: player4, target: enemy2, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy2.health)
            }
        }
        else if enemy == "Enemy 3"
        {
            if character == "Character 1"
            {
                specialAttackHappened(attacker: player1, target: enemy3, damageLabel: enemyDamageLabel)
//                enemyHealthLabel.text = String(enemy3.health)
            }
            else if character == "Character 2"
            {
                specialAttackHappened(attacker: player2, target: enemy3, damageLabel: enemyDamageLabel)
                enemyHealthLabel.text = String(enemy3.health)
            }
            else if character == "Character 3"
            {
                enemyDamageLabel.text = "-0"
                enemy3.health -= 0
                enemyHealthLabel.text = String(enemy3.health)
            }
            else if character == "Character 4"
            {
                specialAttackHappened(attacker: player4, target: enemy3, damageLabel: enemyDamageLabel)
                enemyHealthLabel.text = String(enemy3.health)
            }
        }
        enemyDamageLabel.textColor = UIColor.red
        exclamationLabel.text = "You attacked!"
        UIView.animate(withDuration: 0.3)
        {
            self.playerImage.frame = CGRect(x: 46, y: 283, width: 100, height: 100)
        }
    }
    
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer)
    {
        let random = Int.random(in: 1...5)
        
        if exclamationLabel.text == "You attacked!"
        {
            if enemy == "Enemy 1"
            {
                if character == "Character 1"
                {
                    if enemyDamageLabel.text == "-\(player1.attack - enemy1.defense)"
                    {
                        exclamationLabel.text = "You dealt \(player1.attack - enemy1.defense) damage!"
                    }
                    else if enemyDamageLabel.text == "-\(player1.specialAttack - enemy1.specialDefense)"
                    {
                        exclamationLabel.text = "You dealt \(player1.specialAttack - enemy1.specialDefense) damage!"
                    }
                }
                else if character == "Character 2"
                {
                    if enemyDamageLabel.text == "-0"
                    {
                        exclamationLabel.text = "You dealt 0 damage!"
                    }
                    else if enemyDamageLabel.text == "-\(player2.specialAttack - enemy1.specialDefense)"
                    {
                        exclamationLabel.text = "You dealt \(player2.specialAttack - enemy1.specialDefense) damage!"
                    }
                }
                else if character == "Character 3"
                {
                    if enemyDamageLabel.text == "-\(player3.attack - enemy1.defense)"
                    {
                        exclamationLabel.text = "You dealt \(player3.attack - enemy1.defense) damage!"
                    }
                    else if enemyDamageLabel.text == "-0"
                    {
                        exclamationLabel.text = "You dealt 0 damage!"
                    }
                }
                else if character == "Character 4"
                {
                    if enemyDamageLabel.text == "-\(player4.attack - enemy1.defense)"
                    {
                        exclamationLabel.text = "You dealt \(player4.attack - enemy1.defense) damage!"
                    }
                    else if enemyDamageLabel.text == "-\(player4.specialAttack - enemy1.specialDefense)"
                    {
                        exclamationLabel.text = "You dealt \(player4.specialAttack - enemy1.specialDefense) damage!"
                    }
                }
            }
            else if enemy == "Enemy 2"
            {
                if character == "Character 1"
                {
                    if enemyDamageLabel.text == "-\(player1.attack - enemy2.defense)"
                    {
                        exclamationLabel.text = "You dealt \(player1.attack - enemy2.defense) damage!"
                    }
                    else if enemyDamageLabel.text == "-\(player1.specialAttack - enemy2.specialDefense)"
                    {
                        exclamationLabel.text = "You dealt \(player1.specialAttack - enemy2.specialDefense) damage!"
                    }
                }
                else if character == "Character 2"
                {
                    if enemyDamageLabel.text == "-\(player2.attack - enemy2.defense)"
                    {
                        exclamationLabel.text = "You dealt \(player2.attack - enemy2.defense) damage!"
                    }
                    else if enemyDamageLabel.text == "-\(player2.specialAttack - enemy2.specialDefense)"
                    {
                        exclamationLabel.text = "You dealt \(player2.specialAttack - enemy2.specialDefense) damage!"
                    }
                }
                else if character == "Character 3"
                {
                    if enemyDamageLabel.text == "-\(player3.attack - enemy2.defense)"
                    {
                        exclamationLabel.text = "You dealt \(player3.attack - enemy2.defense) damage!"
                    }
                    else if enemyDamageLabel.text == "-0"
                    {
                        exclamationLabel.text = "You dealt 0 damage!"
                    }
                }
                else if character == "Character 4"
                {
                    if enemyDamageLabel.text == "-\(player4.attack - enemy2.defense)"
                    {
                        exclamationLabel.text = "You dealt \(player4.attack - enemy2.defense) damage!"
                    }
                    else if enemyDamageLabel.text == "-\(player4.specialAttack - enemy2.specialDefense)"
                    {
                        exclamationLabel.text = "You dealt \(player4.specialAttack - enemy2.specialDefense) damage!"
                    }
                }
            }
            else if enemy == "Enemy 3"
            {
                if character == "Character 1"
                {
                    if enemyDamageLabel.text == "-\(player1.attack - enemy3.defense)"
                    {
                        exclamationLabel.text = "You dealt \(player1.attack - enemy3.defense) damage!"
                    }
                    else if enemyDamageLabel.text == "-\(player1.specialAttack - enemy3.specialDefense)"
                    {
                        exclamationLabel.text = "You dealt \(player1.specialAttack - enemy3.specialDefense) damage!"
                    }
                }
                else if character == "Character 2"
                {
                    if enemyDamageLabel.text == "-0"
                    {
                        exclamationLabel.text = "You dealt 0 damage!"
                    }
                    else if enemyDamageLabel.text == "-\(player2.specialAttack - enemy3.specialDefense)"
                    {
                        exclamationLabel.text = "You dealt \(player2.specialAttack - enemy3.specialDefense) damage!"
                    }
                }
                else if character == "Character 3"
                {
                    if enemyDamageLabel.text == "-\(player3.attack - enemy3.defense)"
                    {
                        exclamationLabel.text = "You dealt \(player3.attack - enemy3.defense) damage!"
                    }
                    else if enemyDamageLabel.text == "-0"
                    {
                        exclamationLabel.text = "You dealt 0 damage!"
                    }
                }
                else if character == "Character 4"
                {
                    if enemyDamageLabel.text == "-\(player4.attack - enemy3.defense)"
                    {
                        exclamationLabel.text = "You dealt \(player4.attack - enemy3.defense) damage!"
                    }
                    else if enemyDamageLabel.text == "-\(player4.specialAttack - enemy3.specialDefense)"
                    {
                        exclamationLabel.text = "You dealt \(player4.specialAttack - enemy3.specialDefense) damage!"
                    }
                }
            }
            enemyDamageLabel.text = ""
            UIView.animate(withDuration: 0.3)
            {
                self.playerImage.frame = CGRect(x: 16, y: 283, width: 100, height: 100)
            }
        }
        else if exclamationLabel.text == "You dealt 0 damage!" || exclamationLabel.text == "You dealt \(player1.attack - enemy1.defense) damage!" || exclamationLabel.text == "You dealt \(player2.attack - enemy1.defense) damage!" || exclamationLabel.text == "You dealt \(player3.attack - enemy1.defense) damage!" || exclamationLabel.text == "You dealt \(player4.attack - enemy1.defense) damage!" || exclamationLabel.text == "You dealt \(player1.attack - enemy2.defense) damage!" || exclamationLabel.text == "You dealt \(player2.attack - enemy2.defense) damage!" || exclamationLabel.text == "You dealt \(player3.attack - enemy2.defense) damage!" || exclamationLabel.text == "You dealt \(player4.attack - enemy2.defense) damage!" || exclamationLabel.text == "You dealt \(player1.attack - enemy3.defense) damage!" || exclamationLabel.text == "You dealt \(player2.attack - enemy3.defense) damage!" || exclamationLabel.text == "You dealt \(player3.attack - enemy3.defense) damage!" || exclamationLabel.text == "You dealt \(player4.attack - enemy3.defense) damage!"
        {
            exclamationLabel.text = "The enemy is getting ready to act..."
            if enemy == "Enemy 1"
            {
                if enemy1.defense == 10
                {
                    enemy1.defense = 5
                }
                else
                {
                    
                }
                if enemy1.specialDefense == 15
                {
                    enemy1.specialDefense = 10
                }
                else
                {
                    
                }
            }
            else if enemy == "Enemy 2"
            {
                if enemy2.defense == 5
                {
                    enemy2.defense = 0
                }
                else
                {
                    
                }
                if enemy2.specialDefense == 10
                {
                    enemy2.specialDefense = 5
                }
                else
                {
                    
                }
            }
            else if enemy == "Enemy 3"
            {
                if enemy3.defense == 15
                {
                    enemy3.defense = 10
                }
                else
                {
                    
                }
                if enemy3.specialDefense == 10
                {
                    enemy3.specialDefense = 5
                }
                else
                {
                    
                }
            }
        }
        else if exclamationLabel.text == "The enemy is getting ready to act..."
        {
            if random == 1
            {
                if enemy == "Enemy 1"
                {
                    if character == "Character 1"
                    {
                        attackHappened(attacker: enemy1, target: player1, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player1.health)
                    }
                    else if character == "Character 2"
                    {
                        attackHappened(attacker: enemy1, target: player2, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player2.health)
                    }
                    else if character == "Character 3"
                    {
                        attackHappened(attacker: enemy1, target: player3, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player3.health)
                    }
                    else if character == "Character 4"
                    {
                        attackHappened(attacker: enemy1, target: player4, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player4.health)
                    }
                }
                else if enemy == "Enemy 2"
                {
                    if character == "Character 1"
                    {
                        attackHappened(attacker: enemy2, target: player1, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player1.health)
                    }
                    else if character == "Character 2"
                    {
                        attackHappened(attacker: enemy2, target: player2, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player2.health)
                    }
                    else if character == "Character 3"
                    {
                        attackHappened(attacker: enemy2, target: player3, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player3.health)
                    }
                    else if character == "Character 4"
                    {
                        attackHappened(attacker: enemy2, target: player4, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player4.health)
                    }
                }
                else if enemy == "Enemy 3"
                {
                    if character == "Character 1"
                    {
                        attackHappened(attacker: enemy3, target: player1, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player1.health)
                    }
                    else if character == "Character 2"
                    {
                        attackHappened(attacker: enemy3, target: player2, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player2.health)
                    }
                    else if character == "Character 3"
                    {
                        attackHappened(attacker: enemy3, target: player3, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player3.health)
                    }
                    else if character == "Character 4"
                    {
                        attackHappened(attacker: enemy3, target: player4, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player4.health)
                    }
                }
                playerDamageLabel.textColor = UIColor.red
                exclamationLabel.text = "The enemy attacked!"
                UIView.animate(withDuration: 0.3)
                {
                    self.enemyImage.frame = CGRect(x: 179, y: 258, width: 150, height: 150)
                }
            }
            else if random == 2
            {
                if enemy == "Enemy 1"
                {
                    if character == "Character 1"
                    {
                        specialAttackHappened(attacker: enemy1, target: player1, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player1.health)
                    }
                    else if character == "Character 2"
                    {
                        specialAttackHappened(attacker: enemy1, target: player2, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player2.health)
                    }
                    else if character == "Character 3"
                    {
                        specialAttackHappened(attacker: enemy1, target: player3, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player3.health)
                    }
                    else if character == "Character 4"
                    {
                        specialAttackHappened(attacker: enemy1, target: player4, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player4.health)
                    }
                }
                else if enemy == "Enemy 2"
                {
                    if character == "Character 1"
                    {
                        specialAttackHappened(attacker: enemy2, target: player1, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player1.health)
                    }
                    else if character == "Character 2"
                    {
                        playerDamageLabel.text = "-0"
                        player2.health -= 0
                        playerHealthLabel.text = String(player2.health)
                    }
                    else if character == "Character 3"
                    {
                        specialAttackHappened(attacker: enemy2, target: player3, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player3.health)
                    }
                    else if character == "Character 4"
                    {
                        specialAttackHappened(attacker: enemy2, target: player4, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player4.health)
                    }
                }
                else if enemy == "Enemy 3"
                {
                    if character == "Character 1"
                    {
                        specialAttackHappened(attacker: enemy3, target: player1, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player1.health)
                    }
                    else if character == "Character 2"
                    {
                        specialAttackHappened(attacker: enemy3, target: player2, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player2.health)
                    }
                    else if character == "Character 3"
                    {
                        specialAttackHappened(attacker: enemy3, target: player3, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player3.health)
                    }
                    else if character == "Character 4"
                    {
                        specialAttackHappened(attacker: enemy3, target: player4, damageLabel: playerDamageLabel)
                        playerHealthLabel.text = String(player4.health)
                    }
                }
                playerDamageLabel.textColor = UIColor.red
                exclamationLabel.text = "The enemy attacked!"
                UIView.animate(withDuration: 0.3)
                {
                    self.enemyImage.frame = CGRect(x: 179, y: 258, width: 150, height: 150)
                }
            }
            else if random == 3
            {
                exclamationLabel.text = "The enemy raised its defense!"
                if enemy == "Enemy 1"
                {
                    enemy1.defense = 10
                }
                else if enemy == "Enemy 2"
                {
                    enemy2.defense = 5
                }
                else if enemy == "Enemy 3"
                {
                    enemy3.defense = 15
                }
            }
            else if random == 4
            {
                exclamationLabel.text = "The enemy raised its special defense!"
                if enemy == "Enemy 1"
                {
                    enemy1.specialDefense = 15
                }
                else if enemy == "Enemy 2"
                {
                    enemy2.specialDefense = 10
                }
                else if enemy == "Enemy 3"
                {
                    enemy3.specialDefense = 10
                }
            }
            else if random == 5
            {
                exclamationLabel.text = "The enemy healed itself!"
                if enemy == "Enemy 1"
                {
                    enemy1.health += 10
                    enemyHealthLabel.text = String(enemy1.health)
                }
                else if enemy == "Enemy 2"
                {
                    enemy2.health += 10
                    enemyHealthLabel.text = String(enemy2.health)
                }
                else if enemy == "Enemy 3"
                {
                    enemy3.health += 10
                    enemyHealthLabel.text = String(enemy3.health)
                }
            }
        }
        else if exclamationLabel.text == "The enemy attacked!" || exclamationLabel.text == "The enemy raised its defense!" || exclamationLabel.text == "The enemy raised its special defense!" || exclamationLabel.text == "The enemy healed itself!"
        {
            if enemy == "Enemy 1"
            {
                if character == "Character 1"
                {
                    if playerDamageLabel.text == "-\(enemy1.attack - player1.defense)"
                    {
                        exclamationLabel.text = "The enemy dealt 10 damage!"
                    }
                    else if playerDamageLabel.text == "-\(enemy1.specialAttack - player1.specialDefense)"
                    {
                        exclamationLabel.text = "The enemy dealt 20 damage!"
                    }
                }
                else if character == "Character 2"
                {
                    if playerDamageLabel.text == "-\(enemy1.attack - player2.defense)"
                    {
                        exclamationLabel.text = "The enemy dealt 10 damage!"
                    }
                    else if playerDamageLabel.text == "-\(enemy1.specialAttack - player2.specialDefense)"
                    {
                        exclamationLabel.text = "The enemy dealt 10 damage!"
                    }
                }
                else if character == "Character 3"
                {
                    if playerDamageLabel.text == "-\(enemy1.attack - player3.defense)"
                    {
                        exclamationLabel.text = "The enemy dealt 5 damage!"
                    }
                    else if playerDamageLabel.text == "-\(enemy1.specialAttack - player3.specialDefense)"
                    {
                        exclamationLabel.text = "The enemy dealt 25 damage!"
                    }
                }
                else if character == "Character 4"
                {
                    if playerDamageLabel.text == "-\(enemy1.attack - player4.defense)"
                    {
                        exclamationLabel.text = "The enemy dealt 10 damage!"
                    }
                    else if playerDamageLabel.text == "-\(enemy1.specialAttack - player4.specialDefense)"
                    {
                        exclamationLabel.text = "The enemy dealt 25 damage!"
                    }
                }
            }
            else if enemy == "Enemy 2"
            {
                if character == "Character 1"
                {
                    if playerDamageLabel.text == "-\(enemy2.attack - player1.defense)"
                    {
                        exclamationLabel.text = "The enemy dealt 5 damage!"
                    }
                    else if playerDamageLabel.text == "-\(enemy2.specialAttack - player1.specialDefense)"
                    {
                        exclamationLabel.text = "The enemy dealt 5 damage!"
                    }
                }
                else if character == "Character 2"
                {
                    if playerDamageLabel.text == "-\(enemy2.attack - player2.defense)"
                    {
                        exclamationLabel.text = "The enemy dealt 5 damage!"
                    }
                    else if playerDamageLabel.text == "-0"
                    {
                        exclamationLabel.text = "The enemy dealt 0 damage!"
                    }
                }
                else if character == "Character 3"
                {
                    if playerDamageLabel.text == "-\(enemy2.attack - player3.defense)"
                    {
                        exclamationLabel.text = "The enemy dealt 0 damage!"
                    }
                    else if playerDamageLabel.text == "-\(enemy2.specialAttack - player3.specialDefense)"
                    {
                        exclamationLabel.text = "The enemy dealt 10 damage!"
                    }
                }
                else if character == "Character 4"
                {
                    if playerDamageLabel.text == "-\(enemy2.attack - player4.defense)"
                    {
                        exclamationLabel.text = "The enemy dealt 5 damage!"
                    }
                    else if playerDamageLabel.text == "-\(enemy2.specialAttack - player4.specialDefense)"
                    {
                        exclamationLabel.text = "The enemy dealt 10 damage!"
                    }
                }
            }
            else if enemy == "Enemy 3"
            {
                if character == "Character 1"
                {
                    if playerDamageLabel.text == "-\(enemy3.attack - player1.defense)"
                    {
                        exclamationLabel.text = "The enemy dealt 25 damage!"
                    }
                    else if playerDamageLabel.text == "-\(enemy3.specialAttack - player1.specialDefense)"
                    {
                        exclamationLabel.text = "The enemy dealt 15 damage!"
                    }
                }
                else if character == "Character 2"
                {
                    if playerDamageLabel.text == "-\(enemy3.attack - player2.defense)"
                    {
                        exclamationLabel.text = "The enemy dealt 25 damage!"
                    }
                    else if playerDamageLabel.text == "-\(enemy3.specialAttack - player2.specialDefense)"
                    {
                        exclamationLabel.text = "The enemy dealt 5 damage!"
                    }
                }
                else if character == "Character 3"
                {
                    if playerDamageLabel.text == "-\(enemy3.attack - player3.defense)"
                    {
                        exclamationLabel.text = "The enemy dealt 20 damage!"
                    }
                    else if playerDamageLabel.text == "-\(enemy3.specialAttack - player3.specialDefense)"
                    {
                        exclamationLabel.text = "The enemy dealt 20 damage!"
                    }
                }
                else if character == "Character 4"
                {
                    if playerDamageLabel.text == "-\(enemy3.attack - player4.defense)"
                    {
                        exclamationLabel.text = "The enemy dealt 25 damage!"
                    }
                    else if playerDamageLabel.text == "-\(enemy3.specialAttack - player4.specialDefense)"
                    {
                        exclamationLabel.text = "The enemy dealt 20 damage!"
                    }
                }
            }
            if playerDamageLabel.text == ""
            {
                if exclamationLabel.text == "The enemy raised its defense!"
                {
                    exclamationLabel.text = "The enemy's defense temporarily went up!"
                }
                else if exclamationLabel.text == "The enemy raised its special defense!"
                {
                    exclamationLabel.text = "The enemy's special defense temporarily went up!"
                }
                else if exclamationLabel.text == "The enemy healed itself!"
                {
                    exclamationLabel.text = "The enemy's health went up by 10!"
                }
            }
            playerDamageLabel.text = ""
            UIView.animate(withDuration: 0.3)
            {
                self.enemyImage.frame = CGRect(x: 209, y: 258, width: 150, height: 150)
            }
        }
        else if exclamationLabel.text == "The enemy dealt 0 damage!" || exclamationLabel.text == "The enemy dealt 5 damage!" || exclamationLabel.text == "The enemy dealt 10 damage!" || exclamationLabel.text == "The enemy dealt 15 damage!" || exclamationLabel.text == "The enemy dealt 20 damage!" || exclamationLabel.text == "The enemy dealt 25 damage!" || exclamationLabel.text == "The enemy's defense temporarily went up!" || exclamationLabel.text == "The enemy's special defense temporarily went up!" || exclamationLabel.text == "The enemy's health went up by 10!"
        {
            exclamationLabel.text = "What will you do?"
        }
        
        if player1.health <= 0 || player2.health <= 0 || player3.health <= 0 || player4.health <= 0
        {
            exclamationLabel.text = "You fainted..."
        }
        else if enemy1.health <= 0 || enemy2.health <= 0 || enemy3.health <= 0
        {
            exclamationLabel.text = "The enemy fainted!"
        }
    }
    
    @IBAction func barButtonTapped(_ sender: UIBarButtonItem)
    {
        alert()
    }
    
    func alert()
    {
        let alert = UIAlertController(title: "Play again?", message: nil, preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "Yes", style: .default){action in
            self.player1.health = 100
            self.player2.health = 80
            self.player3.health = 110
            self.player4.health = 90
            self.enemy1.health = 120
            self.exclamationLabel.text = "What will you do?"
            self.playerDamageLabel.text = ""
            self.enemyDamageLabel.text = ""
            UIView.animate(withDuration: 0.3)
            {
                self.playerImage.frame = CGRect(x: 16, y: 283, width: 100, height: 100)
            }
            UIView.animate(withDuration: 0.3)
            {
                self.enemyImage.frame = CGRect(x: 209, y: 258, width: 150, height: 150)
            }
        }
        
        alert.addAction(yesAction)
        
        self.present(alert, animated: true)
    }
    
    func menuMessage()
    {
        let menuVC = UIAlertController(
            title: "Return to Menu",
            message: "Press the 'Menu' button in the top left corner of the screen to return to the menu",
            preferredStyle: .alert)
        let okAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil)
        menuVC.addAction(okAction)
        present(
            menuVC,
            animated: true,
            completion: nil)
    }
    
}
