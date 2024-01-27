//
//  NetworkManager.swift
//  Lensify
//
//  Created by Nazrin on 13.01.24.
//

import Foundation
import Alamofire

class NetworkManager {
    // Alamofire bizden isteyir url + endpoint, method, model, header, parameter, completion, encoding
    static func request<T: Codable>(
        model: T.Type,
        endpoint: String,
        method: HTTPMethod = .get,
        header: HTTPHeaders? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        parameters: Parameters? = nil,
        completion: @escaping((T?, String?)-> Void)) {
            //            print("url: \(NetworkHelper.baseURL)\(endpoint))")
            AF.request(
                "\(NetworkHelper.baseURL)\(endpoint)?client_id=QDkrKxHnXw5_P5WcTxtWfeEbf-XZSntir16cfzE9YSE",
                       method: method,
                       parameters: parameters,
                       encoding: encoding,
                       headers: header).responseDecodable(of: T.self) { response in
                switch response.result {
                case.success(let data):
                    completion(data, nil)
                case.failure(let error):
                    completion(nil, error.localizedDescription)
                }
            }
        }
}
