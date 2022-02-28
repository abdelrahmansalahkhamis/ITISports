//
//  WebServices.swift
//  SportsAppITI
//
//  Created by abdrahman on 24/02/2022.
//

import Foundation


enum NetworkError: Error{
    case decodingError
    case domainError
    case urlError
}

enum HttpMethod: String{
    case get = "GET"
    case post = "POST"
}

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
}

extension Resource{
    init(url: URL){
        self.url = url
    }
}

class WebService{
    static func load<T> (resource: Resource<T>, completion: @escaping(Result<T, NetworkError>) -> Void){
        
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            print("data loaded are => \(data)")
            do{
                let result = try? JSONDecoder().decode(T.self, from: data)
                print("results are :- \(result)")
                if let result = result {
                    DispatchQueue.main.async {
                        completion(.success(result))
                        //print("yes")
                    }
                }else{
                    completion(.failure(.decodingError))
                }
            }catch(let error){
                print("error is ==> \(error)")
            }
            

        }.resume()
    }
}
