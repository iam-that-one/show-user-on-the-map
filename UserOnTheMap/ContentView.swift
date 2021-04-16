//
//  ContentView.swift
//  FindUserOnTheMap
//
//  Created by Abdullah Alnutayfi on 16/04/2021.
//

import SwiftUI
import MapKit
struct ContentView: View {
    @StateObject var vm = UserViewModel()
    var body: some View {

            NavigationView{
       
       
            List{
                
                ForEach(vm.users){ user in
                    NavigationLink(destination: UserDetails(user: user)){
                        VStack{
                    Text("\(user.name ?? "")")
                    }
                }
            }
           
        }.navigationBarTitle(Text("Users"), displayMode: .large)
    
    }.onAppear(){
        vm.users = []
        vm.fetchUserData()}
            
        
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct UserDetails : View {
   // var cordinate : CLLocationCoordinate2D
    var user : User

    
    var map : MapView?
   
    var body: some View{
        ZStack{
            Color.green.opacity(0.50)
            VStack(alignment: .leading){
                Group{
                Text("User id: \(user.id ?? 0)")
                Text("username: \(user.username ?? "")")
                Text("Email: \(user.email ?? "")")
                Text("Company: \(user.company?.name ?? "")")
                Text("phonr: \(user.phone ?? "")")
                Text("website: \(user.website ?? "")")
                Text("street: \(user.address?.street ?? "")")
                }.padding(.leading)
                .offset(y: 50)
               
           
            //.frame(height: 200)
            MapView(coordinate: CLLocationCoordinate2D(latitude: Double(user.address?.geo?.lat ?? "" )! + 47, longitude: Double(user.address?.geo?.lng ?? "")! - 10))
               // .//edgesIgnoringSafeArea(.top)
                .shadow(color: .black,radius: 10)
                
                .frame(width: UIScreen.main.bounds.width - 50, height: 500)
                .offset(y: 50)
        }
            .background(Color.clear)
            .font(.system(size: 15, weight: .bold, design: .rounded))
            .navigationBarTitle(Text("User details"), displayMode: .large)
           
        }.ignoresSafeArea()
        
    }
}


//Double(Int64.random(in: 4 ..< 10))
