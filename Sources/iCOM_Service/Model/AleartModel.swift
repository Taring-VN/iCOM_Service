//
//  AleartModel.swift
//  DemoX
//
//  Created by Nam Nguyễn on 24/11/2022.
//

import Foundation

public enum AleartModel {
    public struct AleartPower: Encodable {
        public init(id: Int, name: String, macAddress: String, ip: String, version: String, hub_id: Int, productId: Int, address: String, ext_dev_id: Int, status: Bool, powerConsumptionLimited: String) {
            self.id = id
            self.name = name
            self.macAddress = macAddress
            self.ip = ip
            self.version = version
            self.hub_id = hub_id
            self.productId = productId
            self.address = address
            self.ext_dev_id = ext_dev_id
            self.status = status
            self.powerConsumptionLimited = powerConsumptionLimited
        }
        
        let id: Int
        let name: String
        let macAddress: String
        let ip: String
        let version: String
        let hub_id: Int
        let productId: Int
        let address: String
        let ext_dev_id: Int
        let status: Bool
        let powerConsumptionLimited: String
    }
}
