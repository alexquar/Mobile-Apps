//
//  NetworkManager.swift
//  MenuApp
//
//  Created by Alex on 2024-10-11.
//

import Foundation
import UIKit
//class for manager
final class NetworkManager {
    //?
    static let shared = NetworkManager()
    
    //setup image cache, NSString is key, UIImage is what we are saving to cache
    private let cache = NSCache<NSString, UIImage>()
    
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
            
            //unwrap all optionals, _ to avoid using ever
        if let _ = error {
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
    
    //download image func
    public func downloadImage(URLString: String, completed: @escaping (UIImage?)->Void){
        //keys will be our image urls so get the requested images key if it is in cache
        let cacheKey = NSString(string: URLString)
        
        //check for cache continue if nil
        if let image = cache.object(forKey: cacheKey){
            //if cached return the image we have
            completed(image)
            return
        }
        
        //no string we return nil for no image
        guard let url = URL(string: URLString) else {
            completed(nil)
            return
        }
        
        
        
    }
    
}
