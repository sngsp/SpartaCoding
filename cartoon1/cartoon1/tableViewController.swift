//
//  tableViewController.swift
//  cartoon1
//
//  Created by Seungseop Lee on 2/27/24.
//

import UIKit

class tableViewController: UIViewController {

    @IBOutlet weak var mainTableview: UITableView!
    
    let cartoons: [String] = ["신의 탑", "윈드브레이커", "화산귀환", "마루는 강쥐", "마음의 소리", "퀘스트지상주의"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        mainTableview.backgroundColor = .white
        mainTableview.delegate = self
        mainTableview.dataSource = self
    }

}

extension tableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartoons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainTableview.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = cartoons[indexPath.row]
        return cell
    }
}
