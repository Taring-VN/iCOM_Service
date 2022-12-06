//
//  Device.swift
//  DemoX
//
//  Created by Nam Nguyễn on 19/11/2022.
//

import Foundation

public struct ListDevices: Codable {
    public init(items: [Items]? = [], totalPages: Int? = nil, totalItems: Int? = nil, nbItems: Int? = nil, pageSize: Int? = nil, pageNumber: Int? = nil, sort: [String]? = [], isFirstPage: Bool? = nil, isLastPage: Bool? = nil, powerConsumption: Int? = nil) {
        self.items = items
        self.totalPages = totalPages
        self.totalItems = totalItems
        self.nbItems = nbItems
        self.pageSize = pageSize
        self.pageNumber = pageNumber
        self.sort = sort
        self.isFirstPage = isFirstPage
        self.isLastPage = isLastPage
        self.powerConsumption = powerConsumption
    }
    
    public var items       : [Items]?  = []
    public var totalPages  : Int?      = nil
    public var totalItems  : Int?      = nil
    public var nbItems     : Int?      = nil
    public var pageSize    : Int?      = nil
    public var pageNumber  : Int?      = nil
    public var sort        : [String]? = []
    public var isFirstPage : Bool?     = nil
    public var isLastPage  : Bool?     = nil
    public var powerConsumption  : Int?      = nil
    
    enum CodingKeys: String, CodingKey {
        case items       = "items"
        case totalPages  = "totalPages"
        case totalItems  = "totalItems"
        case nbItems     = "nbItems"
        case pageSize    = "pageSize"
        case pageNumber  = "pageNumber"
        case sort        = "sort"
        case isFirstPage = "isFirstPage"
        case isLastPage  = "isLastPage"
        case powerConsumption = "powerConsumption"
    }
}

public struct Items: Codable {
    public init(id: Int? = nil, name: String? = nil, mac: String? = nil, ip: String? = nil, version: String? = nil, hubId: Int? = nil, productId: Int? = nil, deviceType: String? = nil, address: String? = nil, extDevId: Int? = nil, status: Bool? = nil, dps: String? = nil, owner: String? = nil, users: [String]? = [], created: Double? = nil, updated: Double? = nil, powerConsumptionLimited: Int?  = nil, deleted: Bool? = nil) {
        self.id = id
        self.name = name
        self.mac = mac
        self.ip = ip
        self.version = version
        self.hubId = hubId
        self.productId = productId
        self.deviceType = deviceType
        self.address = address
        self.extDevId = extDevId
        self.status = status
        self.dps = dps
        self.owner = owner
        self.users = users
        self.created = created
        self.updated = updated
        self.powerConsumptionLimited = powerConsumptionLimited
        self.deleted = deleted
    }
    
    public var id         : Int?      = nil
    public var name       : String?   = nil
    public var mac        : String?   = nil
    public var ip         : String?   = nil
    public var version    : String?   = nil
    public var hubId      : Int?      = nil
    public var productId  : Int?      = nil
    public var deviceType : String?   = nil
    public var address    : String?   = nil
    public var extDevId   : Int?      = nil
    public var status     : Bool?     = nil
    public var dps        : String?   = nil
    public var owner      : String?   = nil
    public var users      : [String]? = []
    public var created    : Double?      = nil
    public var updated    : Double?      = nil
    public var powerConsumptionLimited    : Int?      = nil
    public var deleted    : Bool?     = nil
    public var power      : Int?  = nil
    
    enum CodingKeys: String, CodingKey {
        case id         = "id"
        case name       = "name"
        case mac        = "mac"
        case ip         = "ip"
        case version    = "version"
        case hubId      = "hub_id"
        case productId  = "productId"
        case deviceType = "deviceType"
        case address    = "address"
        case extDevId   = "ext_dev_id"
        case status     = "status"
        case dps        = "dps"
        case owner      = "owner"
        case users      = "users"
        case created    = "created"
        case updated    = "updated"
        case powerConsumptionLimited = "powerConsumptionLimited"
        case deleted    = "deleted"
        case power      = "powers"
    }
}

public struct OnOffDevice: Codable {
    
}

public struct ModelSection: Codable {
    var name: String?
    var isOn: Bool?
}
