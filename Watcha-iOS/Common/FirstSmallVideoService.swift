//
//  FirstSmallVideoService.swift
//  Watcha-iOS
//
//  Created by 한상진 on 2021/06/03.
//

import Foundation
import Alamofire

struct FirstSmallVideoService {
    static let shared = FirstSmallVideoService ()
    
    func getData(completion : @escaping (NetworkResult<Any>) -> Void)
    {
        let url = Constants.API.watchingURL
        
        let header : HTTPHeaders = ["Content-Type": "application/json"]
        let dataRequest = AF.request(url, method: .get, encoding: JSONEncoding.default)
        dataRequest.responseData { dataResponse in
            
            switch dataResponse.result {
            case .success:
                guard let statusCode = dataResponse.response?.statusCode else {return}
                guard let value = dataResponse.value else {return}
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
                
            case .failure:
                completion(.pathErr)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(FirstSmallVideoDataModel.self, from: data)
        else { return .pathErr}
        switch statusCode {
        
        case 200: return .success(decodedData)
        case 400: return .requestErr(decodedData)
        case 500: return .serverErr
        default: return .networkFail
        }
    }
}
