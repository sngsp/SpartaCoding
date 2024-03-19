//
//  ViewController.swift
//  Todo1
//
//  Created by Seungseop Lee on 3/18/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var todoArray: [TodoInfo] = []
    
    // 초기 설정
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 45
        addButton.setTitle("추가하기", for: .normal)
    }
    
    // '추가하기' 버튼 클릭 시 동작
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Todo 추가", message: "할 일을 입력하세요", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "할 일"
        }
        
        let addAction = UIAlertAction(title: "추가", style: .default) { [weak self] _ in
            guard let textField = alertController.textFields?.first, let todoName = textField.text else {
                return
            }
            
            let newTodo = TodoInfo(todoId: self?.todoArray.count ?? 0 + 1, todoName: todoName, isCompleted: false)
            
            self?.todoArray.append(newTodo)
            self?.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
        
    }
    
    // UITableViewDataSource 확장으로 인한 필수구현 함수 2개
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        
        let todo = todoArray[indexPath.row]
        
        cell.todoName.text = todo.todoName
        cell.switchButton.isOn = todo.isCompleted
        cell.switchChanged = { [weak self] isOn in
            self?.todoArray[indexPath.row].isCompleted = isOn
        }
        cell.centerLine = todoArray[indexPath.row].isCompleted
        
        return cell
    }
    
    // Delete 기능을 활성화하는 함수
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            todoArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            
        }
    }
    
}

