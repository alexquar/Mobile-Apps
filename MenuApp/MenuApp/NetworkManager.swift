//
//  NetworkManager.swift
//  MenuApp
//
//  Created by Alex on 2024-10-11.
//

import Foundation

//class for manager
final class NetworkManager {
    //?
    static let shared = NetworkManager()
    
    //base url reqs will go to
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    
    //get app endpoint concat
     private let appetizerURL = baseURL+"appetizers"
    
    //singleton:only one
    private init(){}
    
    //get an appetizer
    //the result<> implies a [Appetizer] is given from a success and an AppetizerError from a failure
    public func getAppetizer(completed: @escaping (Result<[Appetizer], AppetizerError>)->Void){
        
        //get the endpoint as a url object and throw error if we dont have
        guard let url = URL(string: appetizerURL) else {
            completed(.failure(.invalidURL))
            return
        }
        
        //set the task to perform and send api req taking in data,res and error
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)){ data, response, error in
            
            //unwrap all optionals
            guard let error = error else {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            do{
                
                //instance of decoder
                let decoder = JSONDecoder()
                
                //kinda like .json step, type is the model you should have created for the response
                let decodedData = try decoder.decode( AppetizerResponse.self, from: data  )
                completed(.success(decodedData.request))
            } catch {
                //throw error
                completed(.failure(.invalidData))
            }
        }
        
        //resume the task we just made
        task.resume()
    }
}
