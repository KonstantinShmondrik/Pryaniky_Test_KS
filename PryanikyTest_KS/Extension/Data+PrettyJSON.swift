//
//  Data+PrettyJSON.swift
//  PryanikyTest_KS
//
//  Created by Константин Шмондрик on 27.05.2022.
//

import Foundation

extension Data {
    
    var prettyJSON: NSString? { /// NSString gives us a nice sanitized debugDescription
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }

        return prettyPrintedString
    }
}
