//
//  ViewController.swift
//  temptemptemptemp
//
//  Created by Seungseop Lee on 4/9/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var addToWishListButton: UIButton!
    @IBOutlet weak var showAnotherProductButton: UIButton!
    @IBOutlet weak var showWishListPageButton: UIButton!
    
    var currentProduct: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
//        // 당겨서 새로고침을 위한 기능 추가
//        let refreshControl = UIRefreshControl()
//        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: .valueChanged)
//        self.refreshControl = refreshControl
    }
    
    // 당겨서 새로고침 액션
//    @objc func refresh(_ sender: UIRefreshControl) {
//        loadRandomProduct()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
//            sender.endRefreshing()
//        }
//    }
    
    func configureUI() {
        loadRandomProduct()
        titleLabel.numberOfLines = 0
        descriptionLabel.numberOfLines = 0
        addToWishListButton.setTitle("위시리스트 담기", for: .normal)
        addToWishListButton.layer.cornerRadius = 10
        showAnotherProductButton.setTitle("다른 상품 보기", for: .normal)
        showAnotherProductButton.layer.cornerRadius = 10
        showWishListPageButton.setTitle("내 위시리스트", for: .normal)
        showWishListPageButton.layer.cornerRadius = 10
    }
    
    // 랜덤한 제품을 불러오는 매서드
    func loadRandomProduct() {
        let productId = Int.random(in: 1...100)
        APIManager.shared.fetchProduct(withId: productId) { [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let product):
                    self.updateUI(with: product)
                case .failure(let error):
                    print("Error fetching product: \(error)")
                }
            }
        }
    }
    
    // 사용자 화면에 표시될 내용 업데이트
    func updateUI(with product: Product) {
        titleLabel.text = product.title
        priceLabel.text = "\(product.price)$"
        descriptionLabel.text = product.descriptionText
        thumbnailImageView.setImage(from: product.thumbnail)
        currentProduct = product
    }

    // 다른 상품 보여주기
    @IBAction func showAnotherProductButtonTapped(_ sender: UIButton) {
        print("다른 상품 보기 버튼을 클릭했습니다.")
        loadRandomProduct()
    }
    
    @IBAction func addToWishlistButtonTapped(_ sender: UIButton) {
        
        print("위시리스트에 담기 버튼을 클릭했습니다.")
        guard let product = currentProduct else { return }
        
        // 현재 표시된 제품을 wishlist에 추가
        let wishListItem = Product(id: product.id,
                                   title: product.title,
                                   descriptionText: product.descriptionText,
                                   price: product.price,
                                   thumbnail: product.thumbnail)
        CoreDataProduct.save(wishListItem)
        
        showAlert(message: "위시리스트에 담았습니다!")
        print("위시 리스트에 추가된 상품 : ", wishListItem)
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
}

// 이미지 불러오기
extension UIImageView {
    func setImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self, let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.image = image
            }
        }.resume()
    }
}


