//
//  ResponseCollectionSerializable.swift
//  WiVASApp
//
//  Created by Miguel Berrocal Gómez on 07/01/16.
//  Copyright © 2016 WiVAS. All rights reserved.
//

import Alamofire

public protocol ResponseCollectionSerializable {
    static func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> [Self]
}

extension Alamofire.Request {
    public func responseCollection<T: ResponseCollectionSerializable>(completionHandler: Response<[T], NSError> -> Void) -> Self {
        let responseSerializer = ResponseSerializer<[T], NSError> { request, response, data, error in
            guard error == nil else { return .Failure(error!) }
            
            let JSONSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            let result = JSONSerializer.serializeResponse(request, response, data, error)
            
            switch result {
            case .Success(let value):
                if let response = response {
                    return .Success(T.collection(response: response, representation: value))
                } else {
                    
                    let failureReason = "Response collection could not be serialized due to nil response"
                    let error = NSError(
                        domain: Error.Domain,
                        code: Error.Code.JSONSerializationFailed.rawValue,
                        userInfo: [
                            NSLocalizedFailureReasonErrorKey: failureReason
                        ]
                    )
                    
                    return .Failure(error)
                    
                }
            case .Failure(let error):
                return .Failure(error)
            }
        }
        
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}