//
//  SpinnerIndicator.swift
//  COVID
//
//  Created by Pawan kumar on 02/05/20.
//  Copyright © 2020 Pawan Kumar. All rights reserved.
//

import Foundation
import UIKit

class SpinnerIndicator {
    
    var keyWindow: UIWindow?
    
    // MARK: - Properties
    
    static var shared: SpinnerIndicator = {
        let spinnerIndicator = SpinnerIndicator()
        
        // Configuration
        
        return spinnerIndicator
    }()
    
    // MARK: - Initialization
    private init() {

    }
    
    // MARK: - Accessors
    
    public func show() -> Void {
        
        //SpinnerActivity
        keyWindow = UIApplication.shared.keyWindow
        if keyWindow == nil { return }
        
        let loadingNotification = MBProgressHUD.showAdded(to: keyWindow!, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.label.text = "Loading..."
    }
    
    public func hide() -> Void {
    
        keyWindow = UIApplication.shared.keyWindow
        if keyWindow == nil { return }
        
        MBProgressHUD.hide(for: keyWindow!, animated: true)
    }
}
