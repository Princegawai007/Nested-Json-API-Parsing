//
//  ViewController.swift
//  NestedJsonAPIDataFetching
//
//  Created by Prince's Mac on 17/07/22.
//

import UIKit

class ViewController: UIViewController {
    var fetchedData = [FetchedData]()
    var postStreet: String!
    var postSuite: String!
    var postCity : String!
    var postZipcode: String!
    var postLat : String!
    var postLng: String!
    var postCompanyName: String!
    var postCatchPhrase: String!
    var postBs: String!
   
    @IBOutlet weak var urlTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlTableView.delegate =  self
        urlTableView.dataSource = self
        dataPass()
}
    func dataPass(){
        let urlString = "https://jsonplaceholder.typicode.com/users"
        guard let url = URL(string: urlString) else{
            print("URL Invalid")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: request){ (data, response, error) in
            guard let data = data else {
                print("Data Not Found")
                return
            }
            let getjsonObject1 = try! JSONSerialization.jsonObject(with: data) as? [[String:Any]]
            
            for dictionary in getjsonObject1!
            {
                let eachDictionary = dictionary as [String: Any]
                let pId = eachDictionary["id"] as! Int
                let pName = eachDictionary["name"]as! String
                let pUsername = eachDictionary["username"]as! String
                let pEmail = eachDictionary["email"]as! String
                
                if let address = eachDictionary["address"] as? [String:Any]{
                    if let pStreet = address["street"] as? String{
                        self.postStreet = pStreet
                    }
                    if let pSuite = address["suite"] as? String{
                        self.postSuite = pSuite
                    }
                    if let pCity =  address["city"] as? String{
                        self.postCity = pCity
                    }
                    if let pZipcode = address["zipcode"] as? String{
                        self.postZipcode = pZipcode
                    }
                    if let geo = address["geo"] as? [String:Any]{
                        if let pLat = geo["lat"] as? String{
                            self.postLat = pLat
                        }
                        if let pLng = geo["lng"] as? String{
                            self.postLng = pLng
                        }
                    }
                }
                let pPhone = eachDictionary["phone"] as! String
                let pWebsite = eachDictionary["website"] as! String
                  
                   if let company = eachDictionary["company"] as? [String:Any]{
                      if  let pCompanyName = company["name"]as? String{
                            self.postCompanyName = pCompanyName
                        }
                        if let pCatchPhrase = company["catchPhrase"] as? String{
                            self.postCatchPhrase = pCatchPhrase
                        }
                        if let pBs = company["bs"] as? String{
                            self.postBs = pBs
                        }
                    }
                    let newData = FetchedData(postId: pId, postName: pName, postUsername: pUsername, postEmail: pEmail, postStreet: self.postStreet, postSuite:self.postSuite, postCity:self.postCity, postZipcode: self.postZipcode, postLat: self.postLat, postLng: self.postLng, postPhone: pPhone, postWebsite: pWebsite, companyName: self.postCompanyName, catchPhrase: self.postCatchPhrase, postBs: self.postBs)
                    self.fetchedData.append(newData)
                }
                DispatchQueue.main.async {
                    self.urlTableView.reloadData()
                }
            }
            dataTask.resume()
        }
    }
    extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.urlTableView.dequeueReusableCell(withIdentifier: "DataTableViewCell") as! DataTableViewCell
        cell.idLabel.text = String(fetchedData[indexPath.row].postId)
        cell.nameLabel.text = fetchedData[indexPath.row].postName
        cell.usernameLabel.text = fetchedData[indexPath.row].postUsername
        cell.emailLabel.text = fetchedData[indexPath.row].postEmail
        cell.streetLabel.text = fetchedData[indexPath.row].postStreet
        cell.suiteLabel.text = fetchedData[indexPath.row].postSuite
        cell.cityLabel.text = fetchedData[indexPath.row].postCity
        cell.zipcodeLabel.text = fetchedData[indexPath.row].postZipcode
        cell.latLabel.text = fetchedData[indexPath.row].postLat
        cell.lngLabel.text = fetchedData[indexPath.row].postLng
        cell.phoneLabel.text = fetchedData[indexPath.row].postPhone
        cell.websiteLabel.text = fetchedData[indexPath.row].postWebsite
        cell.companyNameLabel.text = fetchedData[indexPath.row].companyName
        cell.catchPhraseLabel.text = fetchedData[indexPath.row].catchPhrase
        cell.bsLabel.text = fetchedData[indexPath.row].postBs
        
        return cell
    }
}
    extension ViewController: UITableViewDelegate{
         func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 550
        }
}
