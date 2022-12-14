//
//  APIRouter.swift
//  DemoX
//
//  Created by Nam Nguyễn on 19/11/2022.
//

import Foundation
import Alamofire


enum APIRouter: URLRequestConvertible {
    
    func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(APIConstants.ContentType.json.rawValue, forHTTPHeaderField: APIConstants.HttpHeaderField.acceptType.rawValue)
        urlRequest.setValue(APIConstants.ContentType.json.rawValue, forHTTPHeaderField: APIConstants.HttpHeaderField.contentType.rawValue)
        urlRequest.setValue(APIConstants.HttpHeaderField.accessToken.rawValue, forHTTPHeaderField: APIConstants.ContentType.token.rawValue)
        
        //Encoding
        let encoding: ParameterEncoding = {
            switch method {
            case .get, .post:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        return try encoding.encode(urlRequest, with: parameters)
    }
    
    // MARK: - APIs
    case listDevices(params: Parameters?)
    case onOffDevice(params: Parameters?)
    
    // MARK: - Helper
    private var path: String {
        switch self {
        case .listDevices: return APIConstants.listDevices
        case .onOffDevice: return APIConstants.onOffDevice
        }
    }
    
    private var method: HTTPMethod {
        switch self {
        case .listDevices:
            return .get
        case .onOffDevice:
            return .post
        }
    }
    
    private var baseUrl: String {
        return APIConstants.BaseURL
    }
    
    private var parameters: Parameters? {
        switch self {
        case .listDevices(let params):
            return params
        case .onOffDevice(let params):
            return params
        }
    }
}
