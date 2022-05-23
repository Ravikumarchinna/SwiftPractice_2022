//
//  HomeVC.swift
//  Swift_Practice2022
//
//  Created by Ravikumar on 19/05/22.
//

import UIKit
import Alamofire

class HomeVC: UIViewController {

    var responseObject:HomeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sendRequest(url: "https://run.mocky.io/v3/126945f6-387b-4cdc-9022-1e075eb9d441",
                    method: "",
                    body: [:], completion: { (userResult: Result<HomeModel>) -> Void in
                        
                        if userResult.isSuccess{
                            self.responseObject = userResult.value
                            if let loginData = userResult.value{
                                print("get login data -->%@",loginData)
                            }
                        }
                        else{
                            print("")
                        }
                    })
    }
    
    // https://run.mocky.io/v3/126945f6-387b-4cdc-9022-1e075eb9d441
    
    

}
