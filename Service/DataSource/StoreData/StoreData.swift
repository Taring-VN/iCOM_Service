//
//  StoreData.swift
//  DemoX
//
//  Created by Nam Nguyễn on 20/11/2022.
//

import Foundation

open class StoreData {
    public init() {
    }
    
    public static let shared = StoreData()
    
    private let itemKey = "ItemKey"
    
    public func getListItems() -> [Items]? {
        if let data = UserDefaults.standard.value(forKey: itemKey) as? Data,
           let dictData = try? JSONDecoder().decode([Items].self, from: data) {
            return dictData
        }
        return nil
    }
    
    public func setListItems(dictData: [Items]?) {
        if let data = try? JSONEncoder().encode(dictData) {
            UserDefaults.standard.set(data, forKey: itemKey)
        }
    }
}
