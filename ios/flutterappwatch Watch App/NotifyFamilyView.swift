//
//  NotifyFamilyView.swift
//  flutterappwatch Watch App
//
//  Created by Danah  on 09/05/2024.
//

import SwiftUI

struct NotifyFamilyView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var session = WatchSessiondDelegate();
    var body: some View {
        VStack{
            Text("Your notification has been sent to your emergency contacts")
                .font(.body)
                .multilineTextAlignment(.center)
            
            
        }
        Button("Notify Family" ,action: {
            session.sendMessage("Help!")
        })
               Spacer()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Back To Home")
                            .font(.headline)
                            .padding()
                            .foregroundColor(Color(hex:"#00AE9A"))
                            .cornerRadius(10)
                    }
                  
                  
                
        
    } }

#Preview {
    NotifyFamilyView()
}
