//
//  OnePageService.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 22.01.2024.
//

import Foundation
import Moya

// MARK: - Service
protocol OnePageService {
    func loadItems(completion: @escaping (Result<OnePageResponse, Error>) -> ())
}
// MARK: - Implementation
enum OnePageTarget {
    case getPhrase
}
extension OnePageTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.chucknorris.io")!
    }
    var path: String {
        return "/jokes/random"
    }
    var method: Moya.Method {
        switch self {
        case .getPhrase:
            return .get
        }
    }
    var task: Moya.Task {
        switch self {
        case .getPhrase:
            return .requestPlain
        }
    }
    var headers: [String : String]? {
        return nil
    }
}

final class OnePageServiceImpl: OnePageService {
    
    private let provider = MoyaProvider<OnePageTarget>()
    
    func loadItems(completion: @escaping (Result<OnePageResponse, Error>) -> ()) {
        provider.request(.getPhrase, completion: { result in
            switch result {
            case.success(let result):
                let data = result.data
                do {
                    let resultModel = try JSONDecoder().decode(OnePageResponse.self, from: data)
                    completion(.success(resultModel))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    
}
