//
//  Speed.swift
//  Speed
//
//  Created by Runkai Zhang on 11/1/19.
//  Copyright © 2019 Runkai Zhang. All rights reserved.
//

import Foundation

enum OptionType: String {
    case help = "h"
    case scan = "s"
    case quit = "q"
    case unknown
    
    init(value: String) {
        switch value {
        case "h": self = .help
        case "s": self = .scan
        case "q": self = .quit
        default: self = .unknown
        }
    }
}

class Speed {
    
    let consoleIO = ConsoleIO()
    
    func staticMode() {
        let argument = CommandLine.arguments[1]
        
        let range = argument.index(argument.startIndex, offsetBy: 1)
        let (option, value) = getOption(String(argument[range...]))
        
        switch option {
        case .help:
            consoleIO.printUsage()
        case .scan:
            consoleIO.writeMessage("Scanned Successfully", to: .standard)
        case .quit:
            consoleIO.writeMessage("Quit command can be only used in Interactive Mode", to: .error)
        default:
            consoleIO.writeMessage("Unknown option \(value)", to: .error)
        }
    }
    
    func getOption(_ option: String) -> (option:OptionType, value: String) {
        return (OptionType(value: option), option)
    }
    
    func interactiveMode() {
        consoleIO.writeMessage("Welcome to Speed Interactive Mode.")
        var shouldQuit = false
        
        while !shouldQuit {
            consoleIO.writeMessage("Type 's' to scan, type 'q' to quit.")
            let (option, value) = getOption(consoleIO.getInput())
            
            switch option {
            case .help:
                consoleIO.printUsage()
            case .scan:
                consoleIO.writeMessage("Scanned Successfully", to: .standard)
            case .quit:
                shouldQuit = true
            default:
                consoleIO.writeMessage("Unknown option \(value)", to: .error)
            }
        }
    }
}
