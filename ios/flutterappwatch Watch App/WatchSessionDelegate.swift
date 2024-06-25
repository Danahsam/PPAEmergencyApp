//
//  WatchSessionDelegate.swift
//  flutterappwatch Watch App
//
//  Created by Danah  on 05/05/2024.
//

import Foundation
import SwiftUI
import WatchConnectivity


class WatchSessiondDelegate : NSObject, ObservableObject, WCSessionDelegate{

    // context
    // received context
    private let session = WCSession.default
    @Published var log = [String]()
    @Published var receivedContext = [String:Any]()
    override init(){
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func session( _ session:WCSession, didReceiveApplicationContext applicationcontext:[String:Any]){
        DispatchQueue.main.async {
            self.log.append("Received context :\(applicationcontext)")
        }
    }
    
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        refresh()
    }

    func session(_ session:WCSession, didReceiveMessage message:[String:Any]){
    
        DispatchQueue.main.async { self.log.append( "Received message :\(message)")}
    }
    
    func sendMessage(_ message:String) {
        var _sendMessage = ["data":message]
        session.sendMessage(_sendMessage, replyHandler: nil)
        log.append("Send message:  \(sendMessage)")
        
    }
    
    func refresh(){
        receivedContext = session.receivedApplicationContext
    }
    
    
}
