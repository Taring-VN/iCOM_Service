//
//  Codable+Extension.swift
//  GSHT
//
//  Created by Leeprohacker on 1/19/20.
//  Copyright © 2020 vcomsat. All rights reserved.
//

import Foundation


public extension Encodable {

    func toRequestParams() -> [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else {
            return nil
        }
        guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            print ("Error convert Encodable to Dictionary ")
            return nil
        }
        return dictionary
    }
}
