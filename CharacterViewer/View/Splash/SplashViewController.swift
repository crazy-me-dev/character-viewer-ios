//
//  ViewController.swift
//  CharacterViewer
//
//  Created by Daniel Song on 6/5/23.
//

import UIKit

class SplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            let splitViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplitViewController")
            self.view.window?.rootViewController = splitViewController
            
        } else {
            self.performSegue(withIdentifier: "sid-list", sender: nil)
        }
    }

}

