//
//  APIClient.swift
//  DemoX
//
//  Created by Nam Nguyễn on 19/11/2022.
//

import Foundation
import Alamofire
import RxSwift


open class APIClient {

    public static let shared = APIClient()

    public func listDevices(params: ControlDeviceModel.ListDevice) -> Observable<ListDevices> {
        let request = APIRouter.listDevices(params: params.toRequestParams()!)
        return APIClient.request(request)
    }
    
    public func onOffDevice(params: HomeModel.ControlDevice) -> Observable<OnOffDevice> {
        let request = APIRouter.onOffDevice(params: params.toRequestParams()!)
        return APIClient.request(request)
    }
    
    public func aleartPower(params: AleartModel.AleartPower) -> Observable<OnOffDevice> {
        let request = APIRouter.onOffDevice(params: params.toRequestParams()!)
        return APIClient.request(request)
    }

    //-------------------------------------------------------------------------------------------------
    //MARK: - The request function to get results in an Observable
    private static func request<T: Codable> (_ urlConvertible: URLRequestConvertible) -> Observable<T> {
        //Create an RxSwift observable, which will be the one to call the request when subscribed to
        return Observable<T>.create { observer in
            //Trigger the HttpRequest using AlamoFire (AF)
            if let url = urlConvertible.urlRequest?.headers {
                print("xxx-request: \(url)")
            } else {
                print("xxx-request:  null")
            }
            let request = AF.request(urlConvertible).responseDecodable { (response: DataResponse<T, AFError>) in
                //Check the result from Alamofire's response and check if it's a success or a failure
                if response.error == nil, let result = response.value {
                    observer.onNext(result)
                    observer.onCompleted()
                } else {
                    observer.onError(parserError(response: response))
                }
            }
            //Finally, we return a disposable to stop the request
            return Disposables.create {
                request.cancel()
            }
        }
    }

    private static func requestBody(_ urlConvertible: URLRequestConvertible) -> Observable<String> {
        //Create an RxSwift observable, which will be the one to call the request when subscribed to
        return Observable<String>.create { observer in
            //Trigger the HttpRequest using AlamoFire (AF)
            if let url = urlConvertible.urlRequest?.url {
                print("xxx-request: \(url)")
            } else {
                print("xxx-request:  null")
            }
            let request = AF.request(urlConvertible).responseData { response in
                //Check the result from Alamofire's response and check if it's a success or a failure
                if response.error == nil, let data = response.data {
                    let result = String(decoding: data, as: UTF8.self)
                    observer.onNext(result)
                    observer.onCompleted()
                } else {
                    observer.onError(parserError(response: response))
                }
            }
            //Finally, we return a disposable to stop the request
            return Disposables.create {
                request.cancel()
            }
        }
    }

    private static func parserError<T: Any>(response: DataResponse<T, AFError>) -> Error {
        var result: Error?
        if let res = response.response {
            switch res.statusCode {
            case 403:
                result = APIError.forbidden
            case 404:
                result = APIError.notFound
            case 409:
                result = APIError.conflict
            case 500:
                result = APIError.internalServerError
            default:
                result = response.error ?? APIError.unknown
            }
        } else {
            if let error = response.error {
                switch error {
                case AFError.sessionTaskFailed(_):
                    result = APIError.disconectToServer
                default: result = error
                }
            } else {
                result = APIError.unknown
            }
        }
        return result ?? APIError.unknown
    }
}
