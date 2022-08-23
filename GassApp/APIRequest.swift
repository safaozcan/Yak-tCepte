//
//  APIRequest.swift
//  GassApp
//
//  Created by Safa özcan on 20.07.2022.
//

import Foundation
enum APIError:Error {
    case responseProblem(error:BaseResponse)
    case decodingProblem
    case encodingProblem
    case commonProblem
}

struct APIRequest{
    

    static var REGISTER = "/user/create"
    static var LOGIN = "/user/login"
    static var GETVEHICLES = "/car/getByToken"
    static var CREATEVEHICLE = "/car/create"
    static var DELETEVEHICLE = "/car/delete"
    static var UPDATEVEHICLE = "/car/update"
    static var GETADDRESS = "/address/getByToken"
    static var CREATEADDRESS = "/address/create"
    static var DELETEADDRESS = "/address/delete"
    static var UPDATEADDRESS = ""
    static var NEARSTATIONS = "/station/getNearStations"
    static var ADDFAVSTATİON = "/station/addFavStation"
    static var LOADFAVS = "/station/getFavStations"
    
    private func send<T:BaseResponse>(_ message: BaseRequest?, endpoint:String, method:String, queryItems:[String:String]?, path:[String:String]?, completion: ((Result<T, APIError>) -> Void)?){
        
        let accessToken = UserDefaults.standard.string(forKey: "ACCES_TOKEN")
        
        do{
            var ep = endpoint
            
            if let p = path{
                for item in p{
                    ep = endpoint.replacingOccurrences(of: "{\(item.key)}", with: item.value)
                }
            }
            
            var component = URLComponents()
            
            component.host = "server-test-be-gasapp.azurewebsites.net"
            component.path = ep
            component.scheme = "https"
           
            
            if let qi = queryItems{
                component.queryItems = []
                
                for item in qi{
                    component.queryItems?.append(URLQueryItem(name: item.key, value: item.value))
                }
            }
            
            if let url =  URL(string: component.string ?? ""){
                var urlRequest = URLRequest(url:url)
                urlRequest.httpMethod = method
                urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
                urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
                //urlRequest.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Accept")

                //let token = accessToken {urlRequest.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")}
                
                if let m = message{
                    urlRequest.httpBody = try JSONEncoder().encode(m)
                }
                
                print("ENDPONT : \(url)")
                if let body = urlRequest.httpBody{
                    print("BODY : \(String(decoding: body, as: UTF8.self))")
                }
                
                let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, _ in
                    if let d = data{
                        print("DATA : \(String(decoding: d, as: UTF8.self))")
                    }
                    
                    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let _ = data else{
                        
                        completion?(.failure(.commonProblem))
                        
                        return
                    }
                    
                    print("STATUS : \(httpResponse.statusCode)")
                    
                    do{
                        if let d = data{
                            let messageData = try JSONDecoder().decode(T.self, from: d)
                            
                            completion?(.success(messageData))
                        }else{
                            completion?(.failure(.decodingProblem))
                        }
                        
                    }catch{
                        completion?(.failure(.decodingProblem))
                    }
                }
                dataTask.resume()
            }else{
                completion?(.failure(.commonProblem))
                print("common")
            }
        }catch{
            completion?(.failure(.encodingProblem))
        }
        
    }
    
    func get<T:BaseResponse>(endpoint:String, completion: ((Result<T, APIError>) -> Void)?, queryItems:[String:String]? = nil, path:[String:String]? = nil){
        send(nil, endpoint: endpoint, method: "GET", queryItems: queryItems, path: path, completion: completion)
    }
    func post<T:BaseResponse>(endpoint:String, completion: ((Result<T, APIError>) -> Void)?, message:BaseRequest? = nil, path:[String:String]? = nil, queryItems:[String:String]? = nil){
        send(message, endpoint: endpoint, method: "POST", queryItems: nil, path: path, completion: completion)
    }
    
    func delete<T:BaseResponse>(endpoint:String, completion: ((Result<T, APIError>) -> Void)?, message:BaseRequest? = nil, path:[String:String]? = nil, queryItems:[String:String]? = nil){
        send(nil, endpoint: endpoint, method: "DELETE", queryItems: queryItems, path: path, completion: completion)
    }
    
    func put<T:BaseResponse>(endpoint:String, completion: ((Result<T, APIError>) -> Void)?, message:BaseRequest? = nil, path:[String:String]? = nil, queryItems:[String:String]? = nil){
        send(message, endpoint: endpoint, method: "PUT", queryItems: queryItems, path: path, completion: completion)
    }
    
    
    //delete
    //put(update)
    //
    
    
}

