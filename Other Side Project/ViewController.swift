//
//  ViewController.swift
//  Other Side Project
//
//  Created by  on 3/28/19.
//  Copyright © 2019 Hayley's Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var menuTitle: UILabel!
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func buttonTapped(_ sender: UIButton)
    {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "StartSegue"
        {
            let characterVC = segue.destination as! CharacterViewController
        }
    }
    
}

