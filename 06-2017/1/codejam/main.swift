//
//  main.swift
//  codejam
//
//  Created by Bruno Rocha on 6/25/17.
//  Copyright © 2017 Bruno Rocha. All rights reserved.
//

import Foundation

//// Reader
let project = "/Users/bruno.rocha/Desktop/MovileRepos/codejam/06-2017/1/"
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

var output = ""

func decrypt(_ word: String) -> String {
    let chars = Array(word.characters)
    var r = String(chars[0])
    var unis: [Int] = [Int(UnicodeScalar(String(chars[0]))!.value) - 65]
    for i in 1..<chars.count-2 {
        let before = Int(UnicodeScalar(String(chars[i-1]))!.value) - 65
        let next = Int(UnicodeScalar(String(chars[i+1]))!.value) - 65
        let sum = 26 - (before + next)
        let rightCharacter = (before - next % 26) + sum
        unis.append(rightCharacter)
        r += String(describing: UnicodeScalar(rightCharacter+65)!)
    }
    let secondCharUnicode = Int(UnicodeScalar(String(chars[1]))!.value) - 65
    let lastCharUnicode = Int(UnicodeScalar(String(chars[chars.count-2]))!.value) - 65
    let firstCharacterUni = (secondCharUnicode + 26) - unis[1]
    let lastCharacterUni = abs(unis[unis.count-2] - (lastCharUnicode + 26))
    let f = String(describing: UnicodeScalar(firstCharacterUni+65)!)
    let l = String(describing: UnicodeScalar(lastCharacterUni+65)!)
    return f + r + l
}

for i in 1..<input.count {
    output += "Case #\(i): \(decrypt(input[i]))"
    if i != input.count - 1 {
        output += "\n"
    }
}

print(output)

Reader.write(output)
