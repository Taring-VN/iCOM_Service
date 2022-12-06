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
    private let timeArr = "timeArr"
    private let sectionKey = "sectionKey_IOT"
    private let onOffKey = "onOffKey_IOT"
    
    
    public func getListItems() -> [[Items]]? {
        if let data = UserDefaults.standard.value(forKey: itemKey) as? Data,
           let dictData = try? JSONDecoder().decode([[Items]].self, from: data) {
            return dictData
        }
        return nil
    }
    
    public func setListItems(dictData: [[Items]]?) {
        if let data = try? JSONEncoder().encode(dictData) {
            UserDefaults.standard.set(data, forKey: itemKey)
        }
    }
    
    public func getListSections() -> [String]? {
        return UserDefaults.standard.stringArray(forKey: sectionKey)
    }
    
    public func setListSections(listSections: [String]?) {
        UserDefaults.standard.set(listSections, forKey: sectionKey)
    }
    
    public func getListOnOff() -> [Bool]? {
        return UserDefaults.standard.object(forKey: onOffKey) as? [Bool]
    }
    
    public func setListOnOff(listOnOff: [Bool]?) {
        UserDefaults.standard.set(listOnOff, forKey: onOffKey)
    }
    
    public func saveTime(_ time: [String]?) {
        UserDefaults.standard.set(time, forKey: timeArr)
    }

    public func getTime() -> [String]? {
        return UserDefaults.standard.stringArray(forKey: timeArr)
    }
}
