//
//  ViewController.swift
//  COVID
//
//  Created by Pawan kumar on 02/05/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//


//https://documenter.getpostman.com/view/10808728/SzS8rjbc?version=latest#43e467ac-2cb0-4409-84e8-e18794e47271

import UIKit

struct ListItem {
    let id : String
    let title : String
}

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var CountriesArray = [Countries]()
    var GlobalArray = [Global]()
    var currentDate: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Countries List
        self.CountriesArray = [ ]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        // For Row Change Height at Run Time
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 50 // Always Greater than 0
        
        // Refresh List
        self.reload_list()
        
        
        // Refresh Countries List
        self.summaryApiRequest()
    }

    func reload_list() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.CountriesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: ListCell? = tableView.dequeueReusableCell(withIdentifier: ListCell.identifier) as? ListCell
        if (cell == nil)
        {
            let nib: Array = Bundle.main.loadNibNamed(ListCell.identifier, owner: self, options: nil)!
            cell = nib[0] as? ListCell
        }
        
        let Countries = self.CountriesArray[indexPath.row]
    
        //Set Values
        cell!.countryLabel.text = Countries.Country
        
        //Circle of View
        self.circleOfViewWith(view: cell!.countryCodeView, border: 1, color: UIColor.clear)
        
        cell!.countryCodeLabel.text = Countries.CountryCode
        
        cell!.newConfirmedLabel.text = Countries.NewConfirmed
        
        cell!.totalConfirmedLabel.text = Countries.TotalConfirmed
        
        cell!.newDeathsLabel.text = Countries.NewDeaths
        
        cell!.totalDeathsLabel.text = Countries.TotalDeaths
        
        cell!.newRecoveredLabel.text = Countries.NewRecovered
        
        cell!.totalRecoveredLabel.text = Countries.TotalRecovered
        
        cell!.dateLabel.text = Countries.Date
        
        return cell!
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //list
        let Countries = self.CountriesArray[indexPath.row]
        print("Countries ", Countries)
    }
    
    // MARK: - Circle Of View With Border Color
    func circleOfViewWith(view: UIView, border: CGFloat, color: UIColor) -> Void {

        view.layer.borderWidth = border //2
        view.layer.cornerRadius = view.bounds.height / 2
        view.layer.borderColor = color.cgColor //Red
        view.layer.masksToBounds = true
    }
}


extension ViewController {
    
    func summaryApiRequest() -> () {
        
        self.CountriesArray.removeAll()
        self.CountriesArray = []
        
        self.GlobalArray.removeAll()
        self.GlobalArray = []
        
        //Display Progress View
        SpinnerIndicator.shared.show()
        
        //API Called
        APIManager.shared.summaryApi(completionHandler: { (jsonResponse) -> Void in
        
            if (jsonResponse["Countries"]) != nil
            {
                let countriesDetails: Array<Any> = jsonResponse["Countries"] as! Array<Any>
                for index in 0..<countriesDetails.count {
                    if let countriesDict = countriesDetails[index] as? [String: Any]
                    {
                        let country = Countries(json: countriesDict)
                        self.CountriesArray.append(country!)
                    }
                }
            }
            
            if (jsonResponse["Global"]) != nil
            {
                if let globalDict = jsonResponse["Global"] as? [String: Any]
                {
                    let global = Global(json: globalDict)
                    self.GlobalArray.append(global!)
                }
            }
            
            if (jsonResponse["Date"]) != nil
            {
                let date = String(describing: jsonResponse["Date"]!)
                self.currentDate = APIManager.shared.isValidObjectValue(value: date)
                self.currentDate = APIManager.shared.convertRecivedDate(date: self.currentDate)
            }
            
            // Refresh List
            self.reload_list()
            
            SpinnerIndicator.shared.hide()
        })
    }
}

