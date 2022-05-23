//
//  ViewController.swift
//  Swift_Practice2022
//
//  Created by Ravikumar on 16/03/22.
//

import UIKit
import WebKit

class ViewController: UIViewController,WKUIDelegate, WKNavigationDelegate  {
    
    var employeeSalary = 20
    @IBOutlet weak var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateEmployeeSalary()
        print(employeeSalary)
        printStringNumbers()
        
        
//        let url = Bundle.main.url(forResource: "file-sample_1MB", withExtension: "docx")!
//        webView.uiDelegate = self
//        webView.navigationDelegate = self
//        webView.loadFileURL(url, allowingReadAccessTo: url)
//        let request = URLRequest(url: url)
//
//        webView.load(request)
        
        
//        let docURL = Bundle.main.url(forResource: "file-sample_1MB", withExtension: "docx")!
//        let docContents = try! Data(contentsOf: docURL)
//        let urlStr = "data:application/msword;base64," + docContents.base64EncodedString()
//        let url = URL(string: urlStr)!
//        let request = URLRequest(url: url)
//        self.webView.load(request)
        
        //...Queues work started
        
        DispatchQueue.global(qos: .userInteractive).async { //...Main
            //...It's for heavy operation
        }
        DispatchQueue.global(qos: .userInteractive).async {
            //...It's for heavy operation
        }
        DispatchQueue.global(qos: .background).async {
            //...It's for heavy operation
        }
        DispatchQueue.global(qos: .default).async {
            //...It's for heavy operation
        }
        
        
        
        
        
        //...Your own Queues
//        let concurrentQueue = DispatchQueue(label: "concurrentQueue", qos: .background, attributes: .concurrent)
//        let serialQueue = DispatchQueue(label: "serialQueue", qos: .background)
//
//        DispatchQueue.global(qos: .background).async {
//
//            for i in 0...5 {
//                print("in background Queue \(i)")
//            }
//        }
//
//        DispatchQueue.global(qos: .userInteractive).async {
//            for i in 0...5 {
//                print("in MainQueue Queue \(i)")
//            }
//        }
        
        
        
        let current = Thread.current
        print("current thread",current,current.stackSize)
        
        let t = Thread()
        t.name = "secondary"
        print("secondary thread with default size",t,t.stackSize)
        
        let t1 = Thread()
        t1.name = "secondary"
        t.stackSize = 4096 * 512
        print("secondary thread",t1,t1.stackSize)
       
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {

        if let response = navigationResponse.response as? HTTPURLResponse {
            if response.statusCode == 401 {
                // ...
            }
        }
        decisionHandler(.allow)
    }
    
    
    
    func updateEmployeeSalary() {
        
        employeeSalary = 70
        defer { employeeSalary = 40
            //    print(employeeSalary)
        }
        defer { employeeSalary = 50
            //   print(employeeSalary)
        }
        defer { employeeSalary = 30
            //   print(employeeSalary)
        }
        
        employeeSalary = 50
        // print(employeeSalary)
     
        //... LIFO _> last in first ot
    }
    
    func printStringNumbers() {
        defer { print("1") }
        defer { print("2") }
        defer { print("3") }
        
        print("4")
    }

    
    
}



