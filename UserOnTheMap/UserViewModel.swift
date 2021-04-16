//
//  UserViewModel.swift
//  FindUserOnTheMap
//
//  Created by Abdullah Alnutayfi on 16/04/2021.
//

import Foundation

class UserViewModel: ObservableObject {
    @Published var users = [User]()
    func fetchUserData(){
        let API_UTL = "https://jsonplaceholder.typicode.com/users"
       URL(string: API_UTL)
        guard let url =  URL(string: API_UTL) else {
            print("invalid url ...")
            return
    }
        let request = URLRequest(url: url)
        let decoder = JSONDecoder()
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil{
                print(error)
            }
                else{
                    if let data = data{
                        do{
                            let result = try decoder.decode([User].self, from: data)
                            print(result)
                            DispatchQueue.main.async {
                                self.users.append(contentsOf: result)
                            }
                        }catch{
                            print(error)
                        }
                    }
                }
        }.resume()
        }
}


struct User: Codable, Identifiable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

// MARK: - Address
struct Address: Codable, Identifiable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
    var id :String?{
        street
    }
   
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String?
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String?
}

