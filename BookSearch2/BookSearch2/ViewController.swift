//
//  ViewController.swift
//  BookSearch2
//
//  Created by Seungseop Lee on 5/3/24.
//

import UIKit

class ViewController: UIViewController {

    // 로그인 버튼 (임시)
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .blue
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI()
    }

    // 로그인 버튼 오토 레이아웃
    func makeUI() {
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            nextButton.widthAnchor.constraint(equalToConstant: 120),
            nextButton.heightAnchor.constraint(equalToConstant: 45),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    // 버튼 누르면 동작하는 코드 -> 코드로 탭바 + 네비게이션바 설정
    @objc func nextButtonTapped() {
        // 탭바컨트롤러 생성
        let tabBarVC = UITabBarController()
        
        // 내비게이션 컨트롤러 루트뷰설정
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        
        // 탭바 이름 설정
        vc1.title = "Search"
        vc2.title = "My Page"
        
        // 탭바로 사용하기 위한 뷰 컨트롤러들 설정
        tabBarVC.setViewControllers([vc1, vc2], animated: true)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .white
        
        // 탭바 이미지 설정 (이미지는 애플이 제공하는 것으로 사용)
        guard let items = tabBarVC.tabBar.items else { return }
        
        items[0].image = UIImage(systemName: "square.and.arrow.up")
        items[1].image = UIImage(systemName: "folder")
        
        // 프리젠트로 탭바를 띄우기
        present(tabBarVC, animated: true, completion: nil)
    }

}

