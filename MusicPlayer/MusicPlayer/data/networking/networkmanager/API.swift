//
//  API.swift
//  MusicPlayer
//
//  Created by Alejandro Fernández Ruiz on 18/4/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import Foundation
import SwiftyJSON
import UIKit


class API: NSObject {
    
    class func search(termParam: String, completion: @escaping (Bool, MusicSearch?, String) ->Void) {
        
        let request = API.request(method: "search?term=" + termParam, http_method: "GET")
        API.sendRequest(request: request) { (success, json, message) in
            
            if success {
                let musicSearch = MusicSearch(json: json!)
                
                if (musicSearch.resultCount! > 0) {
                
                    print(musicSearch)
                    completion(success, musicSearch, "search OK!")
                
                } else {
                    
                   // completion(false,[],NSLocalizedString("data-error", comment: ""))
                    completion(false, nil, NSLocalizedString("data-error1", comment:""))
                    
                }
                
            } else {
                
              //  completion(success,[],message)
                completion(false, nil , NSLocalizedString("data-error2", comment: ""))
            }
            
        }
    }
    
    
   
    
    //MARK:- Request Connection methods
    class func request(method:String, http_method:String) -> NSMutableURLRequest {
        
        let url = NSURL(string:"https://itunes.apple.com/" + method)
        let request:NSMutableURLRequest = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = http_method
        //request.addValue(API_KEY, forHTTPHeaderField: "api_key")
        request.cachePolicy = .reloadIgnoringLocalAndRemoteCacheData//NSURLRequest.CachePolicy.ReloadIgnoringCacheData
        
        return request
        
    }
    
    private class func sendRequest(request: NSURLRequest, completion: ((Bool,JSON?,String) -> Void)?){
        
        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue.main) {(response, data, error) in
            
            if(error == nil){
                
                do {
                    
                    //#if DEBUG
//                   // print( "\n" + Date.stringWithFormat("dd/MM/yy HH:mm:ss") + "-------- \(request.HTTPMethod!):" + (request.URL?.absoluteString)! + " --------")
                    //print((NSString(data: data!, encoding: String.Encoding.utf8.rawValue)! as String))
                    //#endif
                    
                    let dict:NSDictionary = (try JSONSerialization.jsonObject(with: data!, options: [])) as! NSDictionary
                    
                    if (error == nil) {
                        var text = ""
                        if let msg = dict.object(forKey: "data") as? String {
                            text = msg
                        }
                        do{
                            let json = try JSON(data: data!)
                            completion!(true, json, text)
                        }catch is exception {
                            print("Invalid JSON.")
                            completion!(false, nil, "JSON PARSE ERROR")
                        }
                        
                        
                       
                        
                     
                     
                    
                        
                    } else {
                        
                        var msg = ""
                        if let m = dict.object(forKey: "message") as? String{
                            
                            msg = m
                            
                        }
                        
                        completion!(false, nil,msg)
                        
                    }
                    
                } catch let caught as NSError {
                    completion!(false, nil, caught.localizedDescription)
                } catch {
                    completion!(false, nil, "")
                }
                
            } else {
                completion!(false ,nil, (error?.localizedDescription)!)
            }
        }
        
    }
    
    //MARK: - Upload Image methods
//    class func createBodyWithParameters(parameters: [String: String]?, image:UIImage?, boundary: String, imageName:String) -> NSData {
//
//        let body = NSMutableData()
//
//        if parameters != nil {
//            for (key, value) in parameters! {
//                body.append("--\(boundary)\r\n")
//                body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
//                body.append("\(value)\r\n")
//            }
//        }
//
//        if image != nil {
//
//            body.append("--\(boundary)\r\n")
//            body.append("Content-Disposition: form-data; name=\"\(imageName)\"; filename=\"\(imageName).jpg\"\r\n")
//            body.append("Content-Type: image/jpg\r\n\r\n")
//            body.append(UIImageJPEGRepresentation(image!, 0.9)!)
//            body.append("\r\n")
//
//        }
//
//        body.append("--\(boundary)--\r\n")
//        return body
//
//    }
    
    class func generateBoundaryString() -> String {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
    
}
