//
//  ViewController.swift
//  Todo2
//
//  Created by Seungseop Lee on 3/20/24.
//

import UIKit

// Todo에 대한 정보가 담길 구조체

// 메인 클래스
class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    // Todo 구조체의 내용이 담길 빈 배열 생성
    var todoArray: [TodoInfo] = []
    
    // 최초 빌드 시 호출됨
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.rowHeight = 45
        addButton.setTitle("+", for: .normal) // addButton의 텍스트 설정
        
    }

    // "추가하기" 버튼 클릭 시 동작 모음
    @IBAction func addButtonTapped(_ sender: UIButton) {
        // 얼럿 추가
        let alertController = UIAlertController(title: "Todo 추가하기", message: "할 일을 입력하세요.", preferredStyle: .alert)
        // 플레이스 홀더 설정
        alertController.addTextField { textField in
            textField.placeholder = "할 일"
        }
        
        // "추가" 버튼 설정
        let addAction = UIAlertAction(title: "추가", style: .default) { [weak self] _ in
            guard let textField = alertController.textFields?.first, let todoName = textField.text else {
                return
            }
            
            let newTodo = TodoInfo(todoId: self?.todoArray.count ?? 0 + 1, todoName: todoName, isCompleted: false)
            
            self?.todoArray.append(newTodo)
            self?.tableView.reloadData()
        }
        
        // "취소" 버튼 설정
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        // alertController에 "추가"와 "취소" 버튼을 편성
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    // UITableViewController를 확장하면서 필요하게 된 필수구현 함수 2가지.
    
    // TableViewCell에 몇 개의 cell을 표기할건지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // todoArray에 담긴 Index의 갯수만큼
        return todoArray.count
    }
    
    // 셀 데이터 설정 함수
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        let todo = todoArray[indexPath.row]
        
        cell.todoName.text = todo.todoName
        cell.switchButton.isOn = todo.isCompleted
        cell.completedLine = todo.isCompleted
        cell.switchStatus = { [weak self] isOn in
            self?.todoArray[indexPath.row].isCompleted = isOn
        }
        
        return cell
    }
    
    // Todo 삭제 기능 구현
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            todoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            
        }
    }
}

