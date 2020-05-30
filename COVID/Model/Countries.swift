//
//  Countries.swift
//  COVID
//
//  Created by Pawan kumar on 02/05/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import UIKit
import Foundation

class Countries: NSObject, NSCoding {
    
    var Country: String = ""
    var CountryCode: String = ""
    var Slug: String = ""
    var NewConfirmed: String = ""
    var TotalConfirmed: String = ""
    var NewDeaths: String = ""
    var TotalDeaths: String = ""
    var NewRecovered: String = ""
    var TotalRecovered: String = ""
    var Date: String = ""
    
    func getDictionary() -> Dictionary<String,Any> {
       
        let dict = [
            
            "Country": Country,
            "CountryCode": CountryCode,
            "Slug": Slug,
            "NewConfirmed": NewConfirmed,
            "TotalConfirmed": TotalConfirmed,
            "NewDeaths": NewDeaths,
            "TotalDeaths": TotalDeaths,
            "NewRecovered": NewRecovered,
            "TotalRecovered": TotalRecovered,
            "Date": "2020-05-02T11:00:09Z"
            
        ] as Dictionary<String,Any>
        
        return dict
    }
    
    init?(json: [String: Any]) {
    
        //Country
        if (json["Country"]) != nil
        {
            Country = String(describing: json["Country"]!)
            Country = APIManager.shared.isValidObjectValue(value: Country)
        }
        //CountryCode
        if (json["CountryCode"]) != nil
        {
            CountryCode = String(describing: json["CountryCode"]!)
            CountryCode = APIManager.shared.isValidObjectValue(value: CountryCode)
        }
        //Slug
        if (json["Slug"]) != nil
        {
            Slug = String(describing: json["Slug"]!)
            Slug = APIManager.shared.isValidObjectValue(value: Slug)
        }
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
        //Date
        if (json["Date"]) != nil
        {
            Date = String(describing: json["Date"]!)
            Date = APIManager.shared.isValidObjectValue(value: Date)
            Date = APIManager.shared.convertRecivedDate(date: Date)
        }
        
    }
      
    // MARK: - NSCoding
     required init(coder aDecoder: NSCoder) {
         
         if aDecoder.decodeObject(forKey: "Country") == nil {
             Country = ""
         }else{
             Country = aDecoder.decodeObject(forKey: "Country") as! String
         }
         if aDecoder.decodeObject(forKey: "CountryCode") == nil {
             CountryCode = ""
         }else{
             CountryCode = aDecoder.decodeObject(forKey: "CountryCode") as! String
         }
         if aDecoder.decodeObject(forKey: "Slug") == nil {
             Slug = ""
         }else{
             Slug = aDecoder.decodeObject(forKey: "Slug") as! String
         }
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
        if aDecoder.decodeObject(forKey: "Date") == nil {
            Date = ""
        }else{
            Date = aDecoder.decodeObject(forKey: "Date") as! String
        }
         
     }
     
     func encode(with aCoder: NSCoder) {
        aCoder.encode(Country, forKey: "Country")
        aCoder.encode(CountryCode, forKey: "CountryCode")
        aCoder.encode(Slug, forKey: "Slug")
        aCoder.encode(NewConfirmed, forKey: "NewConfirmed")
        aCoder.encode(TotalConfirmed, forKey: "TotalConfirmed")
        aCoder.encode(NewDeaths, forKey: "NewDeaths")
        aCoder.encode(TotalDeaths, forKey: "TotalDeaths")
        aCoder.encode(NewRecovered, forKey: "NewRecovered")
        aCoder.encode(TotalRecovered, forKey: "TotalRecovered")
        aCoder.encode(Date, forKey: "Date")
     }
    
}

