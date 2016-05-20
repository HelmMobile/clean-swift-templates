//
//  ResponseObjectSerializable.swift
//  WiVASApp
//
//  Created by Miguel Berrocal Gómez on 04/01/16.
//  Copyright © 2016 WiVAS. All rights reserved.
//

import Alamofire
import SwiftyJSON

public protocol ResponseObjectSerializable {
    static func object(fromJSON json:JSON) -> AnyObject?
}

extension Alamofire.Request {
    public func responseObject<T: ResponseObjectSerializable>(completionHandler: Response<T, NSError> -> Void) -> Self {
        let responseSerializer = ResponseSerializer<T, NSError> { request, response, data, error in
            guard error == nil else { return .Failure(error!) }
            
            let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            let result = JSONResponseSerializer.serializeResponse(request, response, data, error)
            
            switch result {
            case .Success(let value):
                if let
                    responseObject = T.object(fromJSON: JSON(value)) as? T
                {
                    return .Success(responseObject)
                } else {
                    let failureReason = "JSON could not be serialized into response object: \(value)"
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