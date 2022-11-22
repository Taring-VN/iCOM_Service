//
//  APIError.swift
//  GSHT
//
//  Created by Leeprohacker on 1/19/20.
//  Copyright © 2020 vcomsat. All rights reserved.
//

import Foundation


enum APIError: Error {
    
    case forbidden //Status code 403
    case notFound //Status code 404
    case conflict //Status code 409
    case internalServerError //Status code 500
    
    case unknown
    
    case disconectToServer
    
}
