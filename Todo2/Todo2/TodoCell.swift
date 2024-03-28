//
//  File.swift
//  Todo2
//
//  Created by Seungseop Lee on 3/20/24.
//

import UIKit

class TodoCell: UITableViewCell {
    
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var todoName: UILabel!
    
    var switchStatus:((Bool)->Void)?
    var completedLine = false {
        didSet {
            updateCompletedLine()
        }
    }
    
    // 재사용할 cell을 초기화하는 함수
    override func prepareForReuse() {
        super.prepareForReuse()
        completedLine = false
    }
    
    // 스위치를 눌렀을 때
    @IBAction func switchChanged(_ sender: UISwitch) {
        
        switchStatus?(sender.isOn)
        completedLine = sender.isOn
        
    }
    
    // 완료선 및 글자색 업데이트하는 메서드
    private func updateCompletedLine() {
        if completedLine {
            let attributedString = NSMutableAttributedString(string: todoName.text ?? "")
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributedString.length))
            todoName.attributedText = attributedString
            todoName.textColor = .gray
        } else {
            let attributedString = NSAttributedString(string: todoName.text ?? "")
            todoName.attributedText = attributedString
            todoName.textColor = .black
        }
    }
    
}
