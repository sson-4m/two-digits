//
//  ViewController.swift
//  two digits
//
//  Created by 須藤裕功 on 2022/12/16.
//

import UIKit

class ViewController: UIViewController {

    
    var questionLabel = UILabel()//問題
    
    var numL1 = UILabel()//計算
    var numL2 = UILabel()
    var numL3 = UILabel()
    
    var calculateLabel = UILabel()//足し算
    var answerLabel = UILabel()//答え
    
    var switchButton = UIButton()//切り替えボタン
    var backToMenuButton = UIButton()//戻るボタン
    
    var flag = false//切り替えボタンの機能変更
    
    var numbers1: [Int] = []//数字の入れ物
    var numbers2: [Int] = []
    
    var a1:String = ""//２桁の数字を表示
    var a2:String = ""
    
    var a:Int = 0
    var b:Int = 0
    var c:Int = 0
    var bc:Int = 0
    var d:Int = 0
    var answer = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        calculate()
        
        let position = self.view.bounds.height / 8//ボタンやラベルの位置
        let heightOfNumLabel = self.view.bounds.width / 9//主にnumラベルの高さ
        let widthOfButton = self.view.bounds.width / 2.5//ボタンの幅
        let spaceOfLabel = self.view.bounds.height / 35//ラベル間の隙間
        let heightOfStartButton = self.view.bounds.height / 10
        let fontSizeOfnumbers = self.view.bounds.width / 10
        
        
        self.view.addSubview(backToMenuButton)
        backToMenuButton.translatesAutoresizingMaskIntoConstraints = false
        backToMenuButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        backToMenuButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: position / 2).isActive = true
        backToMenuButton.widthAnchor.constraint(equalToConstant: widthOfButton/3).isActive = true
        backToMenuButton.heightAnchor.constraint(equalToConstant: widthOfButton/3).isActive = true
        backToMenuButton.tag = 1
        backToMenuButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        backToMenuButton.layer.cornerRadius = widthOfButton/6
        backToMenuButton.setImage(UIImage(named: "leftarrow"), for: .normal)
        backToMenuButton.imageEdgeInsets = UIEdgeInsets(top: -10, left: -10, bottom: -10, right: -10)
        
        
        self.view.addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        questionLabel.topAnchor.constraint(equalTo: self.backToMenuButton.bottomAnchor, constant: position/8).isActive = true
        questionLabel.heightAnchor.constraint(equalToConstant: position).isActive = true
        questionLabel.textAlignment = .center
        questionLabel.font = UIFont.systemFont(ofSize: self.view.bounds.width / 5)
        questionLabel.textColor = UIColor.black
        
        
        self.view.addSubview(numL1)
        numL1.translatesAutoresizingMaskIntoConstraints = false
        numL1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        numL1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        numL1.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: position / 3).isActive = true
        numL1.heightAnchor.constraint(equalToConstant: heightOfNumLabel).isActive = true
        numL1.textAlignment = .center
        numL1.font = UIFont.systemFont(ofSize: fontSizeOfnumbers)
        numL1.adjustsFontSizeToFitWidth = true
        numL1.textColor = UIColor(red: 6/255, green: 123/255, blue: 194/255, alpha: 1.0)
        numL1.isHidden = true
        
        
        self.view.addSubview(numL2)
        numL2.translatesAutoresizingMaskIntoConstraints = false
        numL2.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        numL2.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        numL2.topAnchor.constraint(equalTo: numL1.bottomAnchor, constant: spaceOfLabel).isActive = true
        numL2.heightAnchor.constraint(equalToConstant: heightOfNumLabel).isActive = true
        numL2.textAlignment = .center
        numL2.font = UIFont.systemFont(ofSize: fontSizeOfnumbers)
        numL2.adjustsFontSizeToFitWidth = true
        numL2.textColor = UIColor(red: 243/255, green: 119/255, blue: 72/255, alpha: 1.0)
        numL2.isHidden = true
        
        
        self.view.addSubview(numL3)
        numL3.translatesAutoresizingMaskIntoConstraints = false
        numL3.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        numL3.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        numL3.topAnchor.constraint(equalTo: numL2.bottomAnchor, constant: spaceOfLabel).isActive = true
        numL3.heightAnchor.constraint(equalToConstant: heightOfNumLabel).isActive = true
        numL3.textAlignment = .center
        numL3.font = UIFont.systemFont(ofSize: fontSizeOfnumbers)
        numL3.adjustsFontSizeToFitWidth = true
        numL3.textColor = UIColor(red: 236/255, green: 195/255, blue: 11/255, alpha: 1.0)
        numL3.isHidden = true
        
        
        self.view.addSubview(calculateLabel)
        calculateLabel.translatesAutoresizingMaskIntoConstraints = false
        calculateLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        calculateLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        calculateLabel.topAnchor.constraint(equalTo: numL3.bottomAnchor, constant: heightOfNumLabel).isActive = true
        calculateLabel.heightAnchor.constraint(equalToConstant: position / 2).isActive = true
        calculateLabel.textAlignment = .center
        calculateLabel.font = UIFont.systemFont(ofSize: self.view.bounds.width / 10)
        calculateLabel.adjustsFontSizeToFitWidth = true
        calculateLabel.textColor = UIColor.black
        calculateLabel.isHidden = true
        
        
        self.view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        answerLabel.topAnchor.constraint(equalTo: calculateLabel.bottomAnchor, constant: spaceOfLabel/2).isActive = true
        answerLabel.heightAnchor.constraint(equalToConstant: position / 2).isActive = true
        answerLabel.textAlignment = .center
        answerLabel.font = calculateLabel.font
        answerLabel.adjustsFontSizeToFitWidth = true
        answerLabel.textColor = UIColor.black
        answerLabel.isHidden = true
        
        
        self.view.addSubview(switchButton)
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        switchButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -position / 2).isActive = true
        switchButton.widthAnchor.constraint(equalToConstant: widthOfButton).isActive = true
        switchButton.heightAnchor.constraint(equalToConstant: heightOfStartButton).isActive = true
        switchButton.tag = 2
        switchButton.addTarget(self, action: #selector(buttonTapped(_:)), for: UIControl.Event.touchUpInside)
        switchButton.layer.cornerRadius = heightOfStartButton / 2
        switchButton.backgroundColor = UIColor.lightGray // 背景色
        switchButton.layer.borderWidth = 0.1 // 枠線の幅
        switchButton.layer.shadowOffset = CGSize(width: 1, height: 3)//widthで右側に影、heightで下側に影が入る
        switchButton.layer.shadowOpacity = Float(0.6)//影の不透明度、1.0がMAX
        switchButton.layer.shadowRadius = CGFloat(5)//影の幅、数字が大きいほどぼかしが効く
        switchButton.setTitle("解  答", for: .normal)
        switchButton.setTitleColor(UIColor.black, for: .normal)
        switchButton.titleLabel?.font = UIFont.systemFont(ofSize: self.view.bounds.width / 13)
    }
    /*
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        
    }
    */
    
    @objc func buttonTapped(_ sender : Any) {
        switch (sender as AnyObject).tag{
        case 1:
            dismiss(animated: true)
        case 2:
            if(flag){
                calculate()
                numL1.isHidden = true
                numL2.isHidden = true
                numL3.isHidden = true
                calculateLabel.isHidden = true
                answerLabel.isHidden = true
                switchButton.setTitle("解  答", for: .normal)
                flag = false
            }else{
                numL1.isHidden = false
                numL2.isHidden = false
                numL3.isHidden = false
                calculateLabel.isHidden = false
                answerLabel.isHidden = false
                switchButton.setTitle("次の計算", for: .normal)
                flag = true
            }
        default:
            break
        }
    }

    func calculate(){
        for i in 1..<10{
            numbers1.append(i)
            numbers2.append(i)
        }
        numbers1.shuffle()
        prepareNumbers(numbers: numbers1, flag: true)
        
        
        numbers2.shuffle()
        prepareNumbers(numbers: numbers2, flag: false)
        
        plusNumbers()
    }
    
    func prepareNumbers(numbers:[Int], flag: Bool){
        if(flag){
            a1 = String(numbers[0])
            a1 += String(numbers[1])
        }else{
            a2 = String(numbers[0])
            a2 += String(numbers[1])
        }
        questionLabel.text = a1 + " × " + a2
    }
    
    func plusNumbers(){
        a = numbers1[0] * 10 * numbers2[0] * 10
        b = numbers1[1] * numbers2[0]
        c = numbers1[0] * numbers2[1]
        bc = (b+c)*10
        d = numbers1[1] * numbers2[1]
        answer = Int(a1)! * Int(a2)!
        
        numL1.text = "① " + String(numbers1[0] * 10) + " × " + String(numbers2[0] * 10) + " = " + String(a)
        numL2.text = "② (" + String(b) + " + " + String(c) + ") × 10 = " + String(bc)
        numL3.text = "③ " + String(numbers1[1]) + " × " + String(numbers2[1]) + " = " + String(d)
        
        calculateLabel.text = String(a) + " + " + String(bc) + " + " + String(d)
        answerLabel.text = " = " + String(answer)
    }
    
    
    
}

