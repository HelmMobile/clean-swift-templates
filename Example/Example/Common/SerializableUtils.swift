//
//  SerializableUtils.swift
//  Example
//
//  Created by Joel on 05/04/2017.
//  Copyright © 2017 HELM S.C.P. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol ResponseObjectSerializable {
    init?(fromJSON json:JSON)
}

protocol ResponseCollectionSerializable {
    static func collection(fromJSON json:JSON) -> [Self]?
}

extension ResponseCollectionSerializable where Self:ResponseObjectSerializable {
    
    static func collection(fromJSON json:JSON) -> [Self]? {
        var items:[Self] = []
        guard let itemsJSON = json.array else {
            print(json)
            return nil
        }
        for itemJSON in itemsJSON {
            if let item = Self(fromJSON: itemJSON) {
                items.append(item)
            }
        }
        return items
    }
}

extension DataRequest {
    
    func responseObject<T: ResponseObjectSerializable>(
        queue: DispatchQueue? = nil,
        completionHandler: @escaping (DataResponse<T>) -> Void) -> Self
    {
        let responseSerializer = DataResponseSerializer<T> { request, response, data, error in
            guard error == nil else { return .failure(BackendError.network(error: error!)) }
            
            let jsonResponseSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
            let result = jsonResponseSerializer.serializeResponse(request, response, data, nil)
            
            guard case let .success(jsonObject) = result else {
                return .failure(BackendError.jsonSerialization(error: result.error!))
            }
            
            let json = JSON(jsonObject)
            
            guard let responseObject = T(fromJSON: json) else {
                return .failure(BackendError.objectSerialization(reason: "JSON could not be serialized: \(json)"))
            }
            
            return .success(responseObject)
        }
        
        return response(queue: queue, responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
    
    @discardableResult
    func responseCollection<T: ResponseCollectionSerializable>(
        queue: DispatchQueue? = nil,
        completionHandler: @escaping (DataResponse<[T]>) -> Void) -> Self
    {
        let responseSerializer = DataResponseSerializer<[T]> { request, response, data, error in
            guard error == nil else { return .failure(BackendError.network(error: error!)) }
            
            let jsonSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
            let result = jsonSerializer.serializeResponse(request, response, data, nil)
            
            guard case let .success(jsonObject) = result else {
                return .failure(BackendError.jsonSerialization(error: result.error!))
            }
            
            let json = JSON(jsonObject)
            
            guard response != nil else {
                let reason = "Response collection could not be serialized due to nil response."
                return .failure(BackendError.objectSerialization(reason: reason))
            }
            
            guard let items = T.collection(fromJSON:json) else {
                let reason = "Response collection could not be serialized due to nil serialization."
                return .failure(BackendError.objectSerialization(reason: reason))
                
            }
            
            return .success(items)
        }
        
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
    
}

enum BackendError: Error {
    case network(error: Error) // Capture any underlying Error from the URLSession API
    case dataSerialization(error: Error)
    case jsonSerialization(error: Error)
    case xmlSerialization(error: Error)
    case objectSerialization(reason: String)
}
