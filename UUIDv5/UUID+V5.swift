//
//  UUID+V5.swift
//  vault
//
//  Created by Danilo Topalovic on 14.02.16.
//  Copyright © 2016 nerdsee. All rights reserved.
//

import Foundation
import CommonCrypto


// MARK: - V5 UUID
public extension UUID {
        
    /**
     Convenience init with string
     
     - parameter ns:   the string namespace
     - parameter name: the anme
     
     - returns: the instance
     */
    public init?(namespaceString ns: String, name: String) {
        
        guard let uuns = UUID(uuidString: ns) else {
            return nil
        }
        
        self.init(namespace: uuns, name: name)
    }
    
    /**
     Convenience init for building a uuid from V5 Standard using a
     UUID namespace and a string "name"
     
     - parameter ns:   the namespace UUID
     - parameter name: the string
     
     - returns: the instance of UUID
     */
    public init?(namespace ns: UUID, name: String) {
        
        if name.isEmpty {
            return nil
        }
        
        let nsdata   = Data(bytes: ns.byteArray())
        guard let nameData = name.data(using: .utf8) else {
            return nil
        }
        
        let concatData = NSMutableData()
        concatData.append(nsdata)
        concatData.append(nameData)
        
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        CC_SHA1(concatData.bytes, CC_LONG(concatData.length), &digest)
        
        // set UUID version to 5
        digest[6] = ((digest[6] & 0x0F) | 0x50)
        
        // set variant accordingly to RFC4122 (reserved)
        digest[8] = ((digest[8] & 0x3F) | 0x80)
        
        // build uuid_t tuple
        let uuid_t = (digest[0], digest[1], digest[2], digest[3], digest[4], digest[5], digest[6], digest[7], digest[8], digest[9], digest[10], digest[11], digest[12], digest[13], digest[14], digest[15])
        
        self.init(uuid: uuid_t)
    }
    
    /**
     Returns the UUID as array of UInt8
 
     - returns: the uuid array
     */
    private func byteArray() -> [UInt8] {
        
        let innerIterator = Mirror(reflecting: self.uuid).children
        
        var result = [UInt8]()
        for item in innerIterator {
            if let value = item.value as? UInt8 {
                result.append(value)
            }
        }
        
        return result
    }
}
