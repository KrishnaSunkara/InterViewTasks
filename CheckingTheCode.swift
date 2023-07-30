//
//  CheckingTheCode.swift
//  complexitycheck
//
//  Created by Krishna Sunkara on 30/07/23.
//

import Foundation

struct AvailbleSyntaxChecks {
    var startingSymbol: String
    var endingSymbol: String
}

class CheckingTheCode {
    func checkTheGoodString() {
        
        let inputString = "({}[][]){}{}{}()"
        
        let arrofString = inputString.split(separator: "")
        
        let startingValues: [String] = ["(", "{","["]
        let endingValues: [String] = [")", "}","]"]
        
        let closingBracesDict: [String: String] = [
            "(":")",
            "{": "}",
            "[":"]"
        ]
        
        var availableSets : [AvailbleSyntaxChecks] = []
        
        for i in 0..<arrofString.count {
            let symbolis = String(arrofString[i])
            if startingValues.contains(symbolis) {
                availableSets.append(AvailbleSyntaxChecks.init(startingSymbol: String(symbolis), endingSymbol: closingBracesDict[String(symbolis)] ?? ""))
            }
            else {
                if endingValues.contains(symbolis) {
                    if !availableSets.isEmpty {
                        if  let lastObject = availableSets.last {
                            if lastObject.endingSymbol == symbolis {
                                availableSets.removeLast()
                            } else {
                                availableSets.append(AvailbleSyntaxChecks.init(startingSymbol: String(symbolis), endingSymbol: closingBracesDict[String(symbolis)] ?? ""))
                            }
                        }
                    }
                }
            }
        }
        if availableSets.count == 0 {
            print("Its good one")
        } else {
            print("Its a bad one")
        }
    }
    
}
