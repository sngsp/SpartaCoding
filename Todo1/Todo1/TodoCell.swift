//
//  File.swift
//  Todo1
//
//  Created by Seungseop Lee on 3/18/24.
//


// 그만 바꾸기


import UIKit

class TodoCell: UITableViewCell {
    
    
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var todoName: UILabel!
    
    var switchChanged:((Bool)->Void)?
    // 추가된 속성: 가운데 선을 그을지 여부를 나타내는 속성
        var centerLine: Bool = false {
            didSet {
                updateCenterLine()
            }
        }
        
        // 셀이 로드될 때 호출되는 메서드
        override func awakeFromNib() {
            super.awakeFromNib()
            updateCenterLine()
        }
    
    @IBAction func switchButtonTapped(_ sender: UISwitch) {
        
        switchChanged?(sender.isOn)
        centerLine = sender.isOn
        
//        if centerLine == true {
//            addCenterLine()
//        } else {
//            removeCenterLine()
//        }
    }
    
    // 가운데 선 업데이트하는 메서드
        private func updateCenterLine() {
            if centerLine {
                let attributedString = NSMutableAttributedString(string: todoName.text ?? "")
                attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributedString.length))
                todoName.attributedText = attributedString
            } else {
                let attributedString = NSAttributedString(string: todoName.text ?? "")
                todoName.attributedText = attributedString
            }
        }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        centerLine = false
    }
    
//    // 줄 생성
//    private func addCenterLine() {
//        guard let text = todoName.text else { return }
//        let attributedString = NSMutableAttributedString(string: text)
//        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributedString.length))
//        todoName.attributedText = attributedString
//        centerLine = true // 줄이 그려졌음을 표시
//    }
//    
//    // 줄 삭제
//    private func removeCenterLine() {
//        guard let text = todoName.text else { return }
//        let attributedString = NSAttributedString(string: text)
//        todoName.attributedText = attributedString
//        centerLine = false // 줄을 제거함을 표시
//    }
//    
    
}

