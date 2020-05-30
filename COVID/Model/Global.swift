//
//  Global.swift
//  COVID
//
//  Created by Pawan kumar on 02/05/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation

class Global: NSObject, NSCoding {
    
    var NewConfirmed: String = ""
    var NewDeaths: String = ""
    var NewRecovered: String = ""
    var TotalConfirmed: String = ""
    var TotalDeaths: String = ""
    var TotalRecovered: String = ""
    
    func getDictionary() -> Dictionary<String,Any> {
       
        let dict = [
        
            "NewConfirmed": NewConfirmed,
            "NewDeaths": NewDeaths,
            "NewRecovered": NewRecovered,
            "TotalConfirmed": TotalConfirmed,
            "TotalDeaths": TotalDeaths,
            "TotalRecovered": TotalRecovered
            
        ] as Dictionary<String,Any>
        
        return dict
    }
    
    init?(json: [String: Any]) {
    
        //NewConfirmed
        if (json["NewConfirmed"]) != nil
        {
            NewConfirmed = String(describing: json["NewConfirmed"]!)
            NewConfirmed = APIManager.shared.isValidObjectValue(value: NewConfirmed)
        }
        //TotalConfirmed
        if (json["TotalConfirmed"]) != nil
        {
            TotalConfirmed = String(describing: json["TotalConfirmed"]!)
            TotalConfirmed = APIManager.shared.isValidObjectValue(value: TotalConfirmed)
        }
        //NewDeaths
        if (json["NewDeaths"]) != nil
        {
            NewDeaths = String(describing: json["NewDeaths"]!)
            NewDeaths = APIManager.shared.isValidObjectValue(value: NewDeaths)
        }
        //TotalDeaths
        if (json["TotalDeaths"]) != nil
        {
            TotalDeaths = String(describing: json["TotalDeaths"]!)
            TotalDeaths = APIManager.shared.isValidObjectValue(value: TotalDeaths)
        }
        //NewRecovered
        if (json["NewRecovered"]) != nil
        {
            NewRecovered = String(describing: json["NewRecovered"]!)
            NewRecovered = APIManager.shared.isValidObjectValue(value: NewRecovered)
        }
        //TotalRecovered
        if (json["TotalRecovered"]) != nil
        {
            TotalRecovered = String(describing: json["TotalRecovered"]!)
            TotalRecovered = APIManager.shared.isValidObjectValue(value: TotalRecovered)
        }
    }
      
    // MARK: - NSCoding
     required init(coder aDecoder: NSCoder) {
         
         if aDecoder.decodeObject(forKey: "NewConfirmed") == nil {
             NewConfirmed = ""
         }else{
             NewConfirmed = aDecoder.decodeObject(forKey: "NewConfirmed") as! String
         }
        if aDecoder.decodeObject(forKey: "TotalConfirmed") == nil {
            TotalConfirmed = ""
        }else{
            TotalConfirmed = aDecoder.decodeObject(forKey: "TotalConfirmed") as! String
        }
        if aDecoder.decodeObject(forKey: "NewDeaths") == nil {
            NewDeaths = ""
        }else{
            NewDeaths = aDecoder.decodeObject(forKey: "NewDeaths") as! String
        }
        if aDecoder.decodeObject(forKey: "TotalDeaths") == nil {
            TotalDeaths = ""
        }else{
            TotalDeaths = aDecoder.decodeObject(forKey: "TotalDeaths") as! String
        }
        if aDecoder.decodeObject(forKey: "NewRecovered") == nil {
            NewRecovered = ""
        }else{
            NewRecovered = aDecoder.decodeObject(forKey: "NewRecovered") as! String
        }
        if aDecoder.decodeObject(forKey: "TotalRecovered") == nil {
            TotalRecovered = ""
        }else{
            TotalRecovered = aDecoder.decodeObject(forKey: "TotalRecovered") as! String
        }
     }
     
     func encode(with aCoder: NSCoder) {
        
        aCoder.encode(NewConfirmed, forKey: "NewConfirmed")
        aCoder.encode(TotalConfirmed, forKey: "TotalConfirmed")
        aCoder.encode(NewDeaths, forKey: "NewDeaths")
        aCoder.encode(TotalDeaths, forKey: "TotalDeaths")
        aCoder.encode(NewRecovered, forKey: "NewRecovered")
        aCoder.encode(TotalRecovered, forKey: "TotalRecovered")
        
     }
    
}

