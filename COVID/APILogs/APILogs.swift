//
//  APILogs.swift
//  COVID
//
//  Created by Pawan kumar on 02/05/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import Foundation

struct APILogs {

    //MARK:- Print Details

    static func logs<M,D>(printMessage: M, printDetails: D){

        let printMessage = String(describing: printMessage)
        let printDetails = String(describing: printDetails)
        print("PMULogs:- \(printMessage):- \(printDetails)")
    }
}

