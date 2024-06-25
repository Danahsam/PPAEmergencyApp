//
//  HomeView.swift
//  flutterappwatch Watch App
//
//  Created by Danah  on 09/05/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var isTaqdeerImageTapped = false
    
    var body: some View {
        NavigationView {
            VStack{
                Text("GOSI")
                    .font(.system(size: 18))
                    .foregroundColor(Color(hex: "0x9BA0AA"))
                    .padding(.trailing,77)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 190, height: 105)
                        .foregroundColor(Color(hex: "0x00AE9A"))
                    VStack{
                        HStack{
                            Text("4 days left")
                                .padding(.trailing, 44)
                            Image("calendar")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                        }
                        
                        Text("Upcoming Pension")
                            .foregroundColor(.white)
                            .font(.system(size: 14))
                            .padding(.top, 10)
                            .padding(.trailing,30)
                        
                        Text("29th February")
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 20))
                            .padding(.trailing,30)
                    }
                }
                
                HStack{
                    NavigationLink(destination:Menu()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(hex: "0xD94747"))
                                .frame(width: 90, height: 58)
                            VStack{
                                Image("bell")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .padding(.top,3)
                                
                                Spacer(minLength: 0.25)
                                
                                Text("SOS")
                                    .padding(.bottom,3)
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    NavigationLink(destination:TaqdeerCard()) {
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                                .frame(width: 90, height: 58)
                            Image("taqdeer")
                                .resizable()
                                .frame(width: 52, height: 43)
                        }
                    }
                }
            }
        }
    }
}
    

#Preview {
    HomeView()
}
