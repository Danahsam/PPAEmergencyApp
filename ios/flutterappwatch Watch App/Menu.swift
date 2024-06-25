//
//  Menu.swift
//  flutterappwatch Watch App
//
//  Created by Danah  on 09/05/2024.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        
        NavigationView {
            List {
                NavigationLink(destination: EmergencyView()) {
                    HStack {
                        
                        ZStack{
                            Circle()
                                .foregroundColor(Color(hex:"#D94747"))
                                .frame(width: 30, height: 30)
                            Text("sos").foregroundColor(.white)
                        }
                        Text("Tab To Call").padding()
                    }
                    
                    
                }
                NavigationLink(destination: NotifyFamilyView()) {
                    
                    HStack {
                        ZStack{
                            Circle()
                                .foregroundColor(Color(hex: "#00AE9A"))
                                .frame(width: 30, height: 30)
                            Image(systemName: "bell")
                        }
                        Text("Notify Family").padding()
                    }
                }
                NavigationLink(destination: LocationtTest()) {
                    
                    HStack {
                        ZStack{
                            Circle()
                                .foregroundColor(Color(hex: "#ABD02B"))
                                .frame(width: 30, height: 30)
                            Image(systemName: "location.fill")
                        }
                        Text("Share Live Location").padding()
                    }
                }
                
                
                
                
                
                Link("Call Emergency", destination: URL(string: "tel:911")!)
                    .foregroundColor(.white)
                    .padding()
                
                
                
                NavigationLink("Messsages View", destination:ContentView())
                    .foregroundColor(.white)
                    .padding()
            }
            .navigationTitle("Menu")
        }
        
    }
}

#Preview {
    Menu()
}
