//
//  main.swift
//  Speed
//
//  Created by Runkai Zhang on 11/1/19.
//  Copyright © 2019 Runkai Zhang. All rights reserved.
//

import Foundation

let speed = Speed()
if CommandLine.argc < 2 {
    speed.interactiveMode()
} else {
    speed.staticMode()
}
