//
//  NFCHelper.swift
//  biubiubiu
//
//  Created by Tong Lin on 3/9/18.
//  Copyright © 2018 tonglin.t91@gmail.com. All rights reserved.
//

import Foundation
import CoreNFC

class NFCHelper: NSObject {
    func beginSession() {
        let session = NFCNDEFReaderSession(delegate: self, queue: nil, invalidateAfterFirstRead: false)
        session.begin()
    }
}

extension NFCHelper: NFCNDEFReaderSessionDelegate {
    func readerSession(_ session: NFCNDEFReaderSession, didInvalidateWithError error: Error) {
        print("NFC NDEF Invalidated")
        print("\(error)")
    }
    
    func readerSession(_ session: NFCNDEFReaderSession, didDetectNDEFs messages: [NFCNDEFMessage]) {
        for message in messages {
            for record in message.records {
                print("New Record Found:")
                print(record.identifier)
                print(record.payload)
                print(record.type)
                print(record.typeNameFormat)
            }
        }
    }
}
