//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by 宮城 光太朗 on 2023/04/19.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var bgImage2: UIImageView!
    var name: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bgImage2.image = UIImage(named: name)
       
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
