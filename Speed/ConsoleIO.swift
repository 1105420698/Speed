//
//  ConsoleIO.swift
//  Speed
//
//  Created by Runkai Zhang on 11/1/19.
//  Copyright © 2019 Runkai Zhang. All rights reserved.
//

import Foundation

enum OutputType {
    case error
    case standard
}

class ConsoleIO {
    func writeMessage(_ message: String, to: OutputType = .standard) {
        switch to {
        case .standard:
            print("\u{001B}[;m\(message)")
        case .error:
            fputs("\u{001B}[0;31m\(message)\n", stderr)
        }
    }
    
    func printUsage() {
        let executableName = (CommandLine.arguments[0] as NSString).lastPathComponent
        
        writeMessage("usage:")
        writeMessage("\(executableName) -s to scan your current directory")
        writeMessage("\(executableName) -h to show usage information")
        writeMessage("Type \(executableName) without an option to enter Interactive Mode.")
    }
    
    func getInput() -> String {
        let keyboard = FileHandle.standardInput
        let inputData = keyboard.availableData
        let strData = String(data: inputData, encoding: String.Encoding.utf8)!
        return strData.trimmingCharacters(in: CharacterSet.newlines)
    }
}
