//
//  MenuViewController.swift
//  two digits
//
//  Created by 須藤裕功 on 2022/12/31.
//

import UIKit

class MenuViewController: UIViewController {

    
    var titleLabel = UILabel()
    
    var method1Button = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let position = self.view.bounds.height / 8
        let nicePosition = self.view.bounds.height / 22
        let widthOfButton = self.view.bounds.width / 2
        let heightOfLabel = self.view.bounds.height / 8
        let heightOfStartButton = self.view.bounds.height / 8

        self.view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: position).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: heightOfStartButton).isActive = true
        titleLabel.textAlignment = .center
        titleLabel.text = "Two Digits"
        titleLabel.font = UIFont.systemFont(ofSize: self.view.bounds.width / 10)
        titleLabel.textColor = UIColor.black
        
        
        self.view.addSubview(method1Button)
        method1Button.translatesAutoresizingMaskIntoConstraints = false
        method1Button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        method1Button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: nicePosition).isActive = true
        method1Button.widthAnchor.constraint(equalToConstant: widthOfButton).isActive = true
        method1Button.heightAnchor.constraint(equalToConstant: heightOfStartButton).isActive = true
        method1Button.tag = 2
        method1Button.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        method1Button.layer.cornerRadius = heightOfStartButton / 2
        method1Button.backgroundColor = UIColor.lightGray // 背景色
        method1Button.layer.borderWidth = 0.1 // 枠線の幅
        method1Button.layer.shadowOffset = CGSize(width: 1, height: 3)//widthで右側に影、heightで下側に影が入る
        method1Button.layer.shadowOpacity = Float(0.6)//影の不透明度、1.0がMAX
        method1Button.layer.shadowRadius = CGFloat(5)//影の幅、数字が大きいほどぼかしが効く
        method1Button.setTitle("2本曲線法", for: .normal)
        method1Button.setTitleColor(UIColor.black, for: .normal)
        method1Button.titleLabel?.font = UIFont.systemFont(ofSize: self.view.bounds.width / 13)
        // Do any additional setup after loading the view.
    }
    

    @objc func buttonTapped(_ sender : Any) {
        switch (sender as AnyObject).tag{
        case 2:
            performSegue(withIdentifier: "segueToVC", sender: nil)
        default:
            break
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
