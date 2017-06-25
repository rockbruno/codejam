//
//  main.swift
//  codejam
//
//  Created by Bruno Rocha on 6/25/17.
//  Copyright © 2017 Bruno Rocha. All rights reserved.
//

import Foundation

//// Reader
let project = "/Users/bruno.rocha/Desktop/MovileRepos/codejam/06-2017/2/"
let inputFile = "in.in"
final class Reader {
    static func read(_ input: String? = nil) -> [String] {
        let input = input ?? project + inputFile
        let url = URL(fileURLWithPath: input)
        let temp = try! String(contentsOf: url, encoding: String.Encoding.utf8)
        return temp.components(separatedBy: "\n")
    }
    static func write(_ data: String, _ output: String? = nil) {
        let output = output ?? project + "output.out"
        let url = URL(fileURLWithPath: output)
        try! data.write(to: url, atomically: false, encoding: String.Encoding.utf8)
    }
}
let input = Reader.read()
//

let output = input.joined(separator: "\n")
Reader.write(output)
