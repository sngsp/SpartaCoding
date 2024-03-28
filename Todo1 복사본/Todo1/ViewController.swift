//
//  ViewController.swift
//  Todo1
//
//  Created by Seungseop Lee on 3/18/24.
//
/*
import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    

    var todoArray: [TodoInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 45
        addButton.setTitle("추가하기", for: .normal)
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Todo 추가", message: "할 일을 입력하세요", preferredStyle: .alert)
                
                alertController.addTextField { textField in
                    textField.placeholder = "할 일"
                }
                
                let addAction = UIAlertAction(title: "추가", style: .default) { [weak self] _ in
                    guard let textField = alertController.textFields?.first, let todoName = textField.text else {
                        return
                    }
                    
                    let newTodo = TodoInfo(todoId: self?.todoArray.count ?? 0, todoName: todoName, isCompleted: false)
                    
                    self?.todoArray.append(newTodo)
                    self?.tableView.reloadData()
                }
                
                let cancelAction = UIAlertAction(title: "취소", style: .cancel)
                
                alertController.addAction(addAction)
                alertController.addAction(cancelAction)
                
                present(alertController, animated: true)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        
        cell.todoName.text = todoArray[indexPath.row].todoName
        
        return cell
    }
    


}
*/

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var todoList = [Todo]()
    var currentId = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        addButton.setTitle("추가하기", for: .normal)
    }
    
    // MARK: - TableView DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        let todo = todoList[indexPath.row]
        
        // 옵셔널 체이닝을 사용하여 todoName이 nil이 아닌 경우에만 값을 할당합니다.
        cell.todoName.text = todo.todoName ?? "아무것도 없어 추가할 수 없습니다."
        
        cell.switchButton.isOn = todo.isCompleted
        cell.switchValueChanged = { [weak self] isOn in
            self?.todoList[indexPath.row].isCompleted = isOn
        }
        return cell
    }



    
    // MARK: - Add Todo
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Add Todo", message: "Enter todo name", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Todo Name"
        }
        
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let textField = alertController.textFields?.first, let todoName = textField.text else { return }
            self?.currentId += 1
            let newTodo = Todo(id: self?.currentId ?? 0, todoName: todoName, isCompleted: false)
            self?.todoList.append(newTodo)
            self?.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true)
    }
}

