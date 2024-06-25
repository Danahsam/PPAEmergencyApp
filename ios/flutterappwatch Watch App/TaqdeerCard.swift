//
//  TaqdeerCard.swift
//  flutterappwatch Watch App
//
//  Created by Danah  on 09/05/2024.
//
//
//  TaqdeerCard.swift
//  GOSI Watch App
//
//  Created by Danah  on 21/04/2024.
//

import SwiftUI

struct TaqdeerCard: View {
    
    
    var body: some View {
        
        
        ZStack{
            
            VStack(spacing: 0) {
                
                
                UnevenRoundedRectangle(cornerRadii: .init(
                    topLeading:   80.0,
                    bottomLeading:  0,
                    bottomTrailing: 0,
                    topTrailing: 80.0))
                .foregroundColor(Color(hex: "0x00AE9A"))
                .frame(height: 23)
                Rectangle()
                    .frame(width: 195, height: 20)
                    .foregroundColor(Color(hex: "0x00AE9A"))
                
                
                
                
                Rectangle()
                    .frame(width: 195, height: 5)
                    .foregroundColor(Color(hex: "#ABD02B"))
                
                
                
                Rectangle()
                    .frame(width: 195, height: 50)
                    .foregroundColor(Color(hex: "#004D41"))
                
                UnevenRoundedRectangle(cornerRadii: .init(
                    topLeading:   0,
                    bottomLeading:  80.0,
                    bottomTrailing: 80.0,
                    topTrailing: 0))
                .foregroundColor(Color(hex: "#004D41"))
                
                .frame(height: 23)
                
                
            }
            VStack{
                HStack{
                    Image("TaqdeerLight")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.white)
                        .position(x: 25, y: 44)
                    
                    Text("بطاقة متقاعد")
                        .position(x: 33, y: 44)
                        .foregroundColor(Color(hex: "#ABD02B"))
                        .font(.system(size: 15))
                        .fontWeight(.bold)
                    
                    
                    
                    
                }
                
                VStack{
                    Text("فهد حسن خميس الزهراني ")
                        .position(x: 135, y: -6)
                        .font(.system(size: 10))
                        .fontWeight(.bold)
                    Text("Fahad Hassab Khamees Alzahrani")
                        .position(x: 115, y: -11)
                        .font(.system(size: 9))
                        .fontWeight(.bold)
                    Text("Id number :رقم الهوية")
                        .position(x: 145, y:-14)
                        .font(.system(size: 9))
                        .fontWeight(.bold)
                    
                    Text("1234567890")
                        .font(.system(size: 9))
                        .position(x: 155, y:-17)
                        .fontWeight(.bold)
                    
                    
                }
                
            }
        }
        
        
    }
    
}

#Preview {
    TaqdeerCard()
}
