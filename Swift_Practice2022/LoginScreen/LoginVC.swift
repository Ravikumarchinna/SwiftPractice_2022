//
//  LoginVC.swift
//  Swift_Practice2022
//
//  Created by Ravikumar on 19/05/22.
//

import UIKit
import Alamofire

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var txtf_username: UITextField!
    @IBOutlet weak var txtf_pwd: UITextField!
    var responseObject:LoginModel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        let body = ["username" : "ravikumar" , "password":"123"]
//        sendRequest(url: "https://run.mocky.io/v3/60e98d5b-bc55-41f5-be3b-5849ca657808",
//                    method: "POST",
//                    body: body, completion: { (userResult: Result<LoginModel>) -> Void in
//
//                        if userResult.isSuccess{
//                            self.responseObject = userResult.value
//                            if let loginData = userResult.value{
//                                print(loginData.included[0].attributes.name)
//                                print(loginData.included[0].attributes.maleorfemale)
//                            }
//                        }
//                        else{
//                            print("")
//                        }
//                    })
    }
    
    @IBAction func btn_loginAction(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signup = storyboard.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.navigationController?.pushViewController(signup, animated: true)

       // jsonRequest()
    }
    
    @IBAction func btn_signUpAction(_ sender: Any) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signup = storyboard.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(signup, animated: true)
    }
    
    
    //...Alamofire Servicecall
    func jsonRequest(){
        
        guard Connectivity.isConnectedToInternet() else {
            print("Network is not connected")
            return
        }
        
        let url =  "https://run.mocky.io/v3/60e98d5b-bc55-41f5-be3b-5849ca657808"
        let parametr = ["username" : "ravikumar" , "password":"123"]
        
        Alamofire.request(url, method: .post, parameters: parametr, encoding: JSONEncoding.default)
            .responseJSON {  response in
                if let status = response.response?.statusCode {
                    switch(status){
                    case 200:
                        print("example success")
                    default:
                        print("error with response status: \(status)")
                    }
                }
                if let data = response.data{
                    do {
                        let posts = try JSONDecoder().decode(LoginModel.self, from: data)
                        print(posts)
                    }
                    catch{
                        print("data parsing error")
                    }
                }
            }
    }
    
    //...Normal Service Call
    func serviceCall_Login() {
        let url =  "https://run.mocky.io/v3/60e98d5b-bc55-41f5-be3b-5849ca657808"
        let body = ["username" : "ravikumar" , "password":"123"]
        let url1 = URL(string: url)
        
        var request = URLRequest(url: url1!)
        request.httpMethod = "POST"
        request.httpBody = try! JSONEncoder().encode(body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    print("Data is not received")
                }
                return
            }
            let decoder = JSONDecoder()
            do {
                self.responseObject = try decoder.decode(LoginModel.self, from: data)
                if let loginData = self.responseObject{
                    print(loginData.included[0].attributes.name)
                    print(loginData.included[0].attributes.maleorfemale)
                }
                DispatchQueue.main.async {
                    
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    

    
    
} //...Control ends here

