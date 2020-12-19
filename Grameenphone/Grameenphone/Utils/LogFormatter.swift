//
//  LogFormatter.swift
//  SecureChat
//
//  Created by Nazmul's Mac Mini on 27/10/20.
//  Copyright © 2020 TigerIT Foundation. All rights reserved.
//

import Foundation
import CocoaLumberjack

class LogFormatter: NSObject, DDLogFormatter {
    let dateFormatter: DateFormatter

    override init() {
        dateFormatter = DateFormatter()
        dateFormatter.formatterBehavior = .behavior10_4
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss:SSS"

        super.init()
    }
    
    func format(message logMessage: DDLogMessage) -> String? {
        let dateAndTime = dateFormatter.string(from: logMessage.timestamp)
        if let functionName = logMessage.function {
            return "\(dateAndTime) [\(logMessage.flag.description)] [\(logMessage.fileName):\(functionName)]: \(logMessage.line) \(logMessage.message)"
        } else {
            return "\(dateAndTime) [\(logMessage.flag.description)] [\(logMessage.fileName)]: \(logMessage.line) \(logMessage.message)"
        }
    }
}

extension DDLogFlag {
    var description: String {
        switch self {
        case .debug:
            return "DEBUG"
        case .error:
            return "ERROR"
        case .warning:
            return "WARNING"
        case .info:
            return "INFO"
        case .verbose:
            return "VERBOSE"
        default:
            return "UNKNOWN"
        }
    }
}
