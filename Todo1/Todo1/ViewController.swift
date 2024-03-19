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
                    
                    let newTodo = TodoInfo(todoId: self?.todoArray.count ?? 0 + 1, todoName: todoName, isCompleted: false)
                    
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
        cell.switchButton.isOn = todoArray[indexPath.row].isCompleted
        cell.switchChanged = { [weak self] isOn in
            self?.todoArray[indexPath.row].isCompleted = isOn
        }
        
        return cell
    }
    


}



