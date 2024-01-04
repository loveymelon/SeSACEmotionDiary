//
//  ViewController.swift
//  SeSACEmotionDiary
//
//  Created by 김진수 on 1/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var labelList: [UILabel]!
    
    let textList: [String] = ["행복해", "사랑해", "좋아해", "당황해", "속상해", "우울해", "심심해", "행복해", "행복해"]
    var countList: [Int] = UserDefaults.standard.array(forKey: "CountList") as? [Int] ?? Array(repeating: 0, count: 9)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        designLabels()
        designNavgationItem()
    }
    
    func designLabels() {
        var count = 0
        while count < textList.count {
            labelList[count].text = "\(textList[count]) \(countList[count])"
            print(count)
            count += 1
        }
    }
    
    func designNavgationItem() {
        self.navigationItem.title = "감정 다이어리"
        self.navigationItem.leftBarButtonItem = .init(barButtonSystemItem: .action, target: nil, action: nil)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        // 랜덤 숫자
//        labelList[sender.tag].text = "\(textList[sender.tag]) \(Int.random(in: 0...100))"
        
        // 숫자 순차적으로 상승
        
        var countDefault = UserDefaults.standard.array(forKey: "CountList") ?? countList
        var count = countDefault[sender.tag] as? Int ?? 0
        
        count += 1
        countList[sender.tag] = count
        
        UserDefaults.standard.set(countList, forKey: "CountList")
        
        labelList[sender.tag].text = "\(textList[sender.tag]) \(countList[sender.tag]) "
    }
}
    

