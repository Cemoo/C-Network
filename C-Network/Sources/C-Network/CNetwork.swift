import Alamofire
import Foundation

public final class CNetwork: CNetworkProtocol {
    private let configuration: CNConfiguration
    private let urlSession: URLSession
    private let session: Session
    
    public init(configuration: CNConfiguration,
                urlSession: URLSession = URLSession(configuration: .default)) {
        self.configuration = configuration
        self.urlSession = urlSession
        self.session = Session(configuration: urlSession.configuration)
    }
    
    public func fetch<T: CNetworkTask>(with task: T, completionHandler: @escaping (CNetworkResult<T.Response>) -> Void) {
        let headers = HTTPHeaders(task.headers ?? [:])
        
        do {
            let parameters = try task.encodeParameters()
            
            session.request(
                task.url,
                method: task.method,
                parameters: parameters,
                encoding: task.encoding,
                headers: headers
            )
            .validate()
            .responseDecodable(of: T.Response.self) { response in
                switch response.result {
                case .success(let value):
                    completionHandler(.success(value))
                case .failure(let error):
                    completionHandler(.failure(error))
                }
            }
        } catch {
            completionHandler(.failure(error))
        }
    }
}

public enum CNetworkResult<Value> {
    case success(Value)
    case failure(Error)
}
