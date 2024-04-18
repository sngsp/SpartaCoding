//
//  WishListViewController.swift
//  temptemptemp
//
//  Created by Seungseop Lee on 4/9/24.
//

import UIKit
import CoreData


class WishlistViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var wishListMainLabel: UILabel!
    
    var wishList: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        wishListMainLabel.text = "내 위시리스트"
        tableView.dataSource = self
        loadWishList()
        print("viewDidLoad - loadWishList 성공")
        print(wishList)
    }
    
    func loadWishList() {
        wishList = CoreDataProduct.fetchAllProducts()
        tableView.reloadData()
        print("wishList - reloadData 성공")
        print("코어데이터에서 불러온 위시리스트 목록 \(wishList)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("wishList 갯수 파악 완료")
        return wishList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 커스텀 셀을 dequeue
        print("셀에 코어 데이터 불러오기 시작")
        let cell = tableView.dequeueReusableCell(withIdentifier: "WishlistCell", for: indexPath) as! WishlistTableViewCell
        
        if wishList.isEmpty { // 위시 리스트가 비어 있는 경우
            cell.idLabel.text = ""
            cell.nameLabel.text = ""
            cell.priceLabel.text = ""
        } else {
            let product = wishList[indexPath.row]
            cell.idLabel.text = "\(product.id)"
            cell.nameLabel.text = product.title
            cell.priceLabel.text = "\(product.price)$"
            print("셀에 담긴 내용 확인:")
            print("id: \(cell.idLabel.text ?? "")")
            print("name: \(cell.nameLabel.text ?? "")")
            print("price: \(cell.priceLabel.text ?? "")")
        }
        
        print("셀에 코어 데이터 불러오기 성공")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // 코어 데이터에서 해당 제품 삭제
            let deletedProduct = wishList.remove(at: indexPath.row)
            CoreDataProduct.delete(with: deletedProduct.id) // 코어 데이터에서 삭제하는 메서드 호출
            
            // 테이블 뷰에서 해당 셀 삭제
            tableView.deleteRows(at: [indexPath], with: .fade)
            // 리로드데이터 박아야지 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 내일!
        }
        
        //        if editingStyle == .delete {
        //
        //            wishList.remove(at: indexPath.row)
        //            tableView.deleteRows(at: [indexPath], with: .fade)
        //
        //        } else if editingStyle == .insert {
        //
        //        }
        //    }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 1 // 적절한 높이를 설정합니다.
//        }
    
    
}
