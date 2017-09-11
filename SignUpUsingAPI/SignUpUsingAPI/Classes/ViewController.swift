//
//  ViewController.swift
//  SignUpUsingAPI
//
//  Created by Appinventiv Technologies on 11/09/17.
//  Copyright © 2017 Appinventiv Technologies. All rights reserved.
//

import UIKit
import Foundation
class ViewController: UIViewController {
//--------------- Outlet's ----------------
    @IBOutlet weak var signUpTableView: UITableView!
 
    //-------------- Variable's ----------------
    var name: String = ""
    var email:String = ""
    var password:String = ""
    var contact:String = ""
    var adress:String = ""
    var city:String = ""
    var country:String = ""
    var dictData = [String:Any]()
    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
//----------- ViewDidLoad -----------
    override func viewDidLoad() {
        super.viewDidLoad()
//        --------
        
         myActivityIndicator.center = view.center
        myActivityIndicator.isHidden = true
        view.addSubview(myActivityIndicator)
        let cellNib = UINib(nibName: "CustomCellData", bundle: nil)  //--------- Register Nib ...............
        signUpTableView.register(cellNib, forCellReuseIdentifier: "CustomCellDataId")
        
        
        
        signUpTableView.dataSource = self
        signUpTableView.delegate = self
        
        
        
    }
    //------------------------- Method's of class----------------------------
    func getCell(_ button: UIButton) -> UITableViewCell{
        var cell : UIView = button
        while !(cell is CustomCellData) {
            if let super_view = cell.superview {
                cell = super_view
            }else{}
        }
        guard let tableCell = cell as? CustomCellData else {fatalError()}
        return tableCell
    }
    
    
    
    
    
//------- Method for fetch data from API ........
    func fetchDataFromApi(){
        myActivityIndicator.startAnimating()
        let headers = [
            "x-api-key": "haeaderKeyValue",
            "content-type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
            
            ]
        
        let postData = NSMutableData(data: "Name=\(name)".data(using: String.Encoding.utf8)!)
        postData.append("&Email=\(email)".data(using: String.Encoding.utf8)!)
        postData.append("&Password=\(password)".data(using: String.Encoding.utf8)!)
        postData.append("&Contact=\(contact)".data(using: String.Encoding.utf8)!)
        postData.append("&Addrss=\(adress)".data(using: String.Encoding.utf8)!)
        postData.append("&City=\(city)".data(using: String.Encoding.utf8)!)
         postData.append("&Country=\(country)".data(using: String.Encoding.utf8)!)
        let request = NSMutableURLRequest(url: NSURL(string: "https://httpbin.org/post")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let err = error{
                print(err)
            } else {
                guard let httpResponse = response as? HTTPURLResponse else{fatalError("Not get Response:")}
                print(httpResponse)
                guard let reponseData = String(data: data!, encoding: .utf8) else{fatalError("Not get Data in response:")}
                print(reponseData)
                
                
                let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.init(rawValue: 0))
                
                guard let dataDict = json as? [String: Any] else{fatalError(" json is empty")}
                guard let formData = dataDict["form"] as? [String : Any] else {fatalError()}
//                guard let name = formData["Name"] as? String else{fatalError()}
                self.dictData = formData
//                DispatchQueue.main.async { () -> Void in
//                    self.myActivityIndicator.stopAnimating()
//
//                }
                self.myActivityIndicator.isHidden = true
                self.myActivityIndicator.startAnimating()
                
               
                
            }
        })
        
        dataTask.resume()
    }
    @objc  func signUpButtonAction(sender: UIButton) {
    guard   let cell = getCell(sender) as? CustomCellData else{fatalError()}
        name = cell.nameTextField.text!
        email = cell.emailTextField.text!
        password = cell.passwordTextField.text!
        contact = cell.contactTextField.text!
        adress  = cell.addressText.text!
        city = cell.cityTextField.text!
        country = cell.countryTextField.text!
        fetchDataFromApi()
       
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
            self.myActivityIndicator.stopAnimating()
            guard let ob = self.storyboard?.instantiateViewController(withIdentifier: "DisplayVCId") as? DisplayVC else{fatalError()}
            ob.name = self.dictData["Name"]
            ob.email = self.dictData["Email"]
            ob.password = self.dictData["Password"]
            ob.contact = self.dictData["Contact"]
            ob.adress = self.dictData["Address"]
            ob.city = self.dictData["City"]
            ob.country = self.dictData["Country"]
            self.navigationController?.pushViewController(ob, animated: true)
        })
       
       // print(formData["Name"] as! String)
    }

    
}
//======================= Etension of table view =====================

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCellDataId", for: indexPath) as? CustomCellData else{fatalError("Cell not fount:")}
        cell.signUpButton.addTarget(self, action: #selector(ViewController.signUpButtonAction), for: .touchUpInside)
        return cell
    }
    
    
}

































