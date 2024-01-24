//
//  CoreDataService.swift
//  MVP-CoreData-IOS
//
//  Created by Егор Иванов on 24.01.2024.
//

import Foundation
import UIKit
import Moya 



//MARK: - Network
enum CoreDataTarget {
    case getItems
}
extension CoreDataTarget: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.chucknorris.io")!
    }
    var path: String {
        return "/jokes/random"
    }
    var method: Moya.Method {
        switch self {
        case .getItems:
            return .get
        }
    }
    var task: Moya.Task {
        switch self {
        case .getItems:
            return .requestPlain
        }
    }
    var headers: [String : String]? {
        return nil
    }
}
//MARK: - CoreDataService
protocol CoreDataService {
    func loadItems(completion: @escaping (Result<CoreDataModel,Error>) -> Void)
}
//MARK: - CoreDataNetworkService
final class CoreDataNetworkServiceImpl: CoreDataService {
    private let provider = MoyaProvider<CoreDataTarget>()
    func loadItems(completion: @escaping (Result<CoreDataModel, Error>) -> Void) {
        provider.request(.getItems, completion: { result in
            switch result {
            case.success(let result):
                let data = result.data
                do {
                    let resultModel = try JSONDecoder().decode(CoreDataModel.self, from: data)
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
//MARK: - CoreDataServiceImpl
final class CoreDataServiceImpl {
    
}
