//
//  ContentView.swift
//  flutterappwatch Watch App
//
//  Created by Danah  on 05/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var session = WatchSessiondDelegate();
    @State private var message = "";

    var body: some View {
        ScrollView{
            VStack {
                //1.send message
                //1)textfield
                TextField("Enter Your Message ", text: $message).padding()
                
                //2)button
                Button("Send Message" ,action: {
                    session.sendMessage(message)
                })
                //2.refresh
                Button("Refresh", action: {
                    session.refresh()
                })
                //3.log
                Text("Log")
                ForEach(session.log, id:\.self){
                    Text($0)
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
