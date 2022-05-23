//
//  Reusable.swift
//  Swift_Practice2022
//
//  Created by Ravikumar on 20/05/22.
//

import Foundation
import Alamofire

class Connectivity {
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()?.isReachable ?? false
    }
}

