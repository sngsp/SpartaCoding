//
//  ViewController.swift
//  Todo1
//
//  Created by Seungseop Lee on 3/18/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    

    var todoArray: [TodoInfo] = [
        TodoInfo(todoName: "빨래", isCompleted: false),
        TodoInfo(todoName: "설거지", isCompleted: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 45
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

