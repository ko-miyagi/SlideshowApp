//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 宮城 光太朗 on 2023/04/17.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var buttonLabel: UIButton!
    
    @IBOutlet weak var prevImg: UIButton!
    @IBOutlet weak var nextImg: UIButton!
    
    let imageName = ["bg_natural_umi.jpg", "bg_yama.jpeg", "bg_sora.jpeg"]
    var imageNo = 0
    var name: String = "bg_natural_umi.jpg"
    var timer: Timer!
    var timerFlag: Bool = false //タイマーが始動しているか
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name = "bg_natural_umi.jpg"
        buttonLabel.setTitle("再生", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextImage(_ sender: Any) {
        if imageNo == 0 {
            imageNo = 1
        }
        else if imageNo == 1 {
            imageNo = 2
        }
        else if imageNo == 2 {
            imageNo = 0
        }
        name = imageName[imageNo]
        bgImage.image = UIImage(named: name)
    }
    
    @IBAction func prevImage(_ sender: Any) {
        if imageNo == 0 {
            imageNo = 2
        }
        else if imageNo == 1 {
            imageNo = 0
        }
        else if imageNo == 2 {
            imageNo = 1
        }
        name = imageName[imageNo]
        bgImage.image = UIImage(named: name)
    }
    
    @objc func changeImg(_ timer: Timer) {
        if imageNo == 2 {
            imageNo = 0
        }
        else {
            imageNo += 1
        }
        name = imageName[imageNo]
        bgImage.image = UIImage(named: name)
    }
    
    @IBAction func PlayStop(_ sender: Any) {
        if !timerFlag {
            //「進む」「戻る」ボタンを無効化
            nextImg.isEnabled = false
            prevImg.isEnabled = false
            
            //スライドショー開始(タイマー生成・再生)
            buttonLabel.setTitle("停止", for: .normal)
            if self.timer == nil {
                self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImg(_:)), userInfo: nil, repeats: true)
            }
            timerFlag = true
            
        } else {
            //「進む」「戻る」ボタンを有効化
            nextImg.isEnabled = true
            prevImg.isEnabled = true
            
            //スライドショー停止(タイマー停止)
            buttonLabel.setTitle("再生", for: .normal)
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
            timerFlag = false
            
        }
    }
    
    @IBAction func imgTap(_ sender: Any) {
        //print("タイマー止めてるよ")
        if timerFlag {
            buttonLabel.setTitle("再生", for: .normal)
            if self.timer != nil {
                self.timer.invalidate()
                self.timer = nil
            }
            timerFlag = false
        }
        
        //「進む」「戻る」ボタンを有効化
        nextImg.isEnabled = true
        prevImg.isEnabled = true
        
        // タイマーを停止後、画面遷移
        self.performSegue(withIdentifier: "ToNextView", sender: nil)
    }
    
    // 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segueから遷移先のImageViewControllerを取得する
        let imageViewController:ImageViewController = segue.destination as! ImageViewController
        // 遷移先のImageViewControllerで宣言しているnameに代入して渡す
        imageViewController.name = name
    }
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
}

