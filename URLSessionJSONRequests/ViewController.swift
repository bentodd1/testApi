//
//  ViewController.swift
//  URLSessionJSONRequests
//
//  Created by Kyle Lee on 4/23/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func onGetTapped(_ sender: Any) {
        
        guard let url = URL(string: "http://ec2-54-202-22-175.us-west-2.compute.amazonaws.com:8081/listUsers") else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            if let response = response {
                print(response)
            }
            
            if let data = data {
                print(data)
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
                
            }
        }.resume()
    }
    
    
    @IBAction func onPostTapped(_ sender: Any) {
        
        //let parameters = ["username": "@kilo_loco", "tweet": "HelloWorld"]
        
        guard let url = URL(string: "http://ec2-54-202-22-175.us-west-2.compute.amazonaws.com:8081/addUser") else { return }
     
        //request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        //request.httpBody = httpBody
        let sessionConfig = URLSessionConfiguration.default
        
        let session = URLSession(configuration:sessionConfig)
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
       
            
            if let response = response {
                print(response)
            }
            
            if let statusCode = (response as? HTTPURLResponse)?.statusCode{
                print(statusCode)
            }
            
            if let data = data {
                do {
                    print("here")
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error)
                }
            }
            
        }
        
        task.resume()
        
    }
    
    
}



















