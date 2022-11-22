//
//  HomeModel.swift
//  DemoX
//
//  Created by Nam Nguyễn on 19/11/2022.
//

import Foundation

public enum HomeModel {
    public struct ControlDevice: Encodable {
        public init(mac: String, status: Bool) {
            self.mac = mac
            self.status = status
        }
        
        let mac: String
        let status: Bool
    }
}
