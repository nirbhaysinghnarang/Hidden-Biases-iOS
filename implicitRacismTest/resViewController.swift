//
//  resViewController.swift
//  implicitRacismTest
//
//  Created by Nirbhay Singh on 04/07/20.
//  Copyright © 2020 Nirbhay Singh. All rights reserved.
//

import UIKit

class resViewController: UIViewController {

    @IBOutlet weak var resLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        resLbl.text = res
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
