//
//  EmergencyView.swift
//  flutterappwatch Watch App
//
//  Created by Danah  on 09/05/2024.
//


import SwiftUI

struct EmergencyView: View {
    @State private var callStatus = "Calling..."
    var body: some View {
        
        VStack {
            Image("bell")
                .resizable()
                .frame(width: 70, height: 70)
                .padding(.bottom, -14.0)

            Text("911")
                .font(.largeTitle)
            Text(callStatus)
                .foregroundColor(Color(hex: "#D94747"))
                .padding(.bottom, 24.0)
                .onAppear {
                    Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
                        self.callStatus = "01:32"
                    }
                }
            Button(action: {
                // Add your hangup action here
            })
            {
                ZStack{
                    RoundedRectangle(cornerRadius: 30)
                        .frame(width: 176, height: 36)
                        .foregroundColor(Color(hex: "#D94747"))
                    
                    Image(systemName: "phone.down.fill")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .padding()
                }
            }
            
        }
    }
}

#Preview {
    EmergencyView()
}
