//
//  APIConstants.swift
//  DemoX
//
//  Created by Nam Nguyễn on 19/11/2022.
//

import Foundation


enum APIConstants {

    public static let BaseURL = "http://103.160.84.179:8081/esmart-api/device"

    // Device
    public static let listDevices = "list"
    public static let onOffDevice = "on-off"
 
    //The header fields
    enum HttpHeaderField: String {
        case authentication = "Authorization"
        case contentType = "Content-Type"
        case acceptType = "Accept"
        case acceptEncoding = "Accept-Encoding"
        case accessToken = "eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImlhdCI6MTY2ODc4MDA4NSwiZXhwIjoxNjc0ODI4MDg1fQ.d8PsFWpFhn6ldNk1M8vyVBgP3gTFZ5bHaxqg-1_HV3whsAwgyVBogXQMi4z9BxlfhSsONNL69w6P4x4euh-Ypw"
    }

    enum ContentType: String {
        case json = "application/json"
        case token = "X-ESMART-TOKEN"
    }

    enum FormatDataResponse: String {
        case DateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        case DateFormatRq = "yyyy/MM/dd'T'HH:mm"
    }
}
