//
//  ChoiceViewController.swift
//  PropositoClient
//
//  Created by Matheus Gois on 09/07/19.
//  Copyright © 2019 Matheus Gois. All rights reserved.
//

import UIKit

class ChoiceViewController: UIViewController {

    @IBAction func close(_ sender: Any) {
        let transition: CATransition = CATransition()
        transition.duration = 0.78
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromBottom
        self.view.window!.layer.add(transition, forKey: nil)
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
