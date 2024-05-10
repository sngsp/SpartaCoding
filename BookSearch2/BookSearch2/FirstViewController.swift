//
//  File.swift
//  BookSearch2
//
//  Created by Seungseop Lee on 5/3/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "검색"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeUI1()
    }
    
    func makeUI1() {
        
        // 네비게이션 바 설정
        view.backgroundColor = .systemBackground
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationController?.navigationBar.tintColor = .blue

        navigationItem.scrollEdgeAppearance = navigationBarAppearance
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.compactAppearance = navigationBarAppearance

        navigationController?.setNeedsStatusBarAppearanceUpdate()
        
        navigationController?.navigationBar.isTranslucent = false
        //navigationController?.navigationBar.backgroundColor = .white
        title = "Search"
        
        // 서치바 설정
        view.addSubview(searchBar)
        
        // 서치바 테두리 둥글게 만들고 테두리 컬러 설정하기
        searchBar.layer.cornerRadius = 15
        searchBar.layer.borderWidth = 1
        searchBar.layer.borderColor = UIColor.systemBlue.cgColor
        
        // 서치바 위 아래의 회색 선 없애기위한 이미지 설정
        searchBar.backgroundImage = UIImage()
        
        // 서치바 오토 레이아웃
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
}

