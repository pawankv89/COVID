//
//  APIManager.swift
//  COVID
//
//  Created by Pawan kumar on 02/05/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//



import Foundation
import UIKit

class APIManager {
    
    public enum HTTPMethod: String {
        case OPTIONS = "OPTIONS"
        case GET     = "GET"
        case HEAD    = "HEAD"
        case POST    = "POST"
        case PUT     = "PUT"
        case PATCH   = "PATCH"
        case DELETE  = "DELETE"
        case TRACE   = "TRACE"
        case CONNECT = "CONNECT"
    }
    
    static let shared = APIManager()
    

    //Constructor
    private init() { }
    
    func convertRecivedDate(date: String = "") -> String {
        
        var dateRecived: String = date
        
        if date.count == 0 {
            return dateRecived
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"  //2020-05-02T12:41:23Z
        let date = dateFormatter.date(from: dateRecived)
        
        dateFormatter.dateFormat = "dd-MMM-yyyy hh:mm:ss a" // dd MMM
        if date != nil {
            dateRecived = dateFormatter.string(from: date!)
        }
        
        //Print
        //let functionName: String = #function
        //APILogs.logs(printMessage: "\(functionName) convertRecivedDate", printDetails: dateRecived)
        
        return dateRecived
    }
   
    func isValidObjectValue(value: String) -> String {
        
        var isValidString = value
        if isValidString == "null" || isValidString == "<null>" || isValidString == "(null)"  {
            isValidString = ""
        }
        return isValidString
    }

    //Headers

    func customCommonHeaders() -> [String : String] {

        var headers: Dictionary <String, String> = [:]
        
        //Fixed Headers Authorization
        //headers["Accept"] = "application/json"
        //headers["Content-Type"] = "application/json"
        //headers["Content-Type"] = "application/json; charset=utf-8"
        headers["Content-Type"] = "application/x-www-form-urlencoded"
        
        return headers
    }
    
    //Get All Countries List
    
    func summaryApi(completionHandler: @escaping (NSDictionary)-> ()) {
        
        let functionName: String = #function
        
        //Check Internet Connection
        if NetworkManager.shared.isConnected == false {
            
            //Toast.shared.showToastMessage(message: "You are not connected to the internet please try later")
            completionHandler([:]) //Go back
            return
        }
        
        // Set up the URL request
        var urlEndpoint: String = APIConfig.summaryApi
        
        //Encoaded URL before Request
        urlEndpoint = urlEndpoint.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        //Print
        APILogs.logs(printMessage: "\(functionName) Request", printDetails: urlEndpoint)
        
        //HTTP REQUEST HERE
        var request = URLRequest(url: URL(string: urlEndpoint)!)
        request.httpMethod = HTTPMethod.GET.rawValue //"GET"
        
        //Add Custom Common Headers
        request.allHTTPHeaderFields = self.customCommonHeaders()
        
        //Print
        APILogs.logs(printMessage: "\(functionName) Header", printDetails: request.allHTTPHeaderFields)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            (data, response, error) -> Void in
            if let unwrappedData = data {
                do {
                    
                    let responseObject: Any = try JSONSerialization.jsonObject(with: unwrappedData, options: JSONSerialization.ReadingOptions.mutableContainers)
                    
                    //Print
                    APILogs.logs(printMessage: "\(functionName) Response", printDetails: responseObject)
                    
                    //Check Status Code
                    if let httpStatus = response as? HTTPURLResponse {
                        
                        if  httpStatus.statusCode <= 299  && httpStatus.statusCode >= 200 {
                            //Print
                            APILogs.logs(printMessage: "\(functionName) statusCode should be 200, but is", printDetails: httpStatus.statusCode)
                            
                            if responseObject is NSDictionary {
                           
                                let resposeList: NSDictionary = responseObject as! NSDictionary
                                completionHandler(resposeList)
                            }
                            if responseObject is Array<Any> {
                             
                                //let resposeList: Array<Any> = (responseObject as? Array<Any>)!
                                //completionHandler(resposeList)
                                completionHandler([:])
                            }
                        }
                        else{
                            //Wrong Status code here
                        }
                    }
                }
                catch {
                    
                    //Got Respomnse here
                    completionHandler([:])
                }
            }
        }
        task.resume()
    }
}

