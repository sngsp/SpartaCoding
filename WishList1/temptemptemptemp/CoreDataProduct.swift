//
//  CoreDataProduct.swift
//  temptemptemp
//
//  Created by Seungseop Lee on 4/9/24.
//

import Foundation
import CoreData

struct CoreDataProduct {
    
    // 코어 데이터에 product를 저장
    static func save(_ product: Product) {
        let context = CoreDataStack.shared.context
        let entity = NSEntityDescription.entity(forEntityName: "ProductEntity", in: context)!
        let productEntity = NSManagedObject(entity: entity, insertInto: context)
        productEntity.setValue(product.id, forKey: "id")
        productEntity.setValue(product.title, forKey: "title")
        productEntity.setValue(product.descriptionText, forKey: "descriptionText")
        productEntity.setValue(product.price, forKey: "price")
        productEntity.setValue(product.thumbnail, forKey: "thumbnail")
        
        do {
            try context.save()
            print("코어 데이터에 저장 성공")
        } catch let error as NSError {
            print("코어 데이터에 저장 실패 , \(error), \(error.userInfo)")
        }
    }
    
    // 코어 데이터 내 모든 제품을 반환
    static func fetchAllProducts() -> [Product] {
        let context = CoreDataStack.shared.context
        let fetchRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        
        do {
            let products = try context.fetch(fetchRequest)
            return products.map { Product(id: Int($0.id),
                                          title: $0.title ?? "",
                                          descriptionText: $0.descriptionText ?? "",
                                          price: Int($0.price),
                                          thumbnail: $0.thumbnail ?? "") }
        } catch {
            print("코어 데이터 불러오기 오류 : \(error.localizedDescription)")
            return []
        }
    }
    
    static func delete(with id: Int) {
        let context = CoreDataStack.shared.context
        let fetchRequest: NSFetchRequest<ProductEntity> = ProductEntity.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %d", id)
        
        do {
            let products = try context.fetch(fetchRequest)
            guard let productToDelete = products.first else { return }
            context.delete(productToDelete)
            try context.save()
            print("제품 삭제 성공")
        } catch {
            print("제품 삭제 오류: \(error.localizedDescription)")
        }
    }
}

