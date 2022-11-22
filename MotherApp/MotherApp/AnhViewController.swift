//
//  AnhViewController.swift
//  DemoX
//
//  Created by Nam Nguyễn on 21/11/2022.
//

import UIKit
import iCOM_Service

class AnhViewController: UIViewController {

    @IBAction func navigateToICOM(_ sender: Any) {
        let vc = ControlDeviceVC()
        navigationController?.pushViewController(vc, animated: true)
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
