//
//  APIRequest.swift
//  BlissApp
//
//  Created by Eren Erten on 17.02.2023.
//

import Foundation
import RxSwift

class APIRequest {
    
    func createURLRequestWith(router:Router) -> URLRequest{
        var components = URLComponents()
              components.scheme = router.scheme
              components.host = router.host
              components.path = router.path
              components.queryItems = router.parameters
        let url = components.url
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = router.method
        return urlRequest
    }
    
    let session = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask? = nil
    
    func callAPIWithStandardModelObject<T:Codable>(router:Router, objectType : T.Type) -> Observable<T> {
        
        let urlRequest = createURLRequestWith(router: router)
        return Observable<T>.create{ observer in
            self.dataTask = self.session.dataTask(with: urlRequest, completionHandler: {(data,response,error) in
                do {
                    let model = try JSONDecoder().decode(T.self, from: data ?? Data())
                    
                    observer.onNext(model)
                }
                
                catch let error{
                    observer.onError(error)
                }
                observer.onCompleted()
            })
            self.dataTask?.resume()
            return Disposables.create {
                self.dataTask?.cancel()
            }
        }
    }
    
    func callAPIWithoutStandardModelObject(router:Router) -> Observable<[String:String]>{
    
        let urlRequest = createURLRequestWith(router: router)
        return Observable<[String:String]>.create{ observer in
            self.dataTask = self.session.dataTask(with: urlRequest, completionHandler: {(data,response,error) in
                do {
        
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:String]
                    
                    observer.onNext(json!)
                }
                
                catch let error{
                    observer.onError(error)
                }
                observer.onCompleted()
            })
            self.dataTask?.resume()
            return Disposables.create {
                self.dataTask?.cancel()
            }
        }
        
    }
    
  
    
    
}
