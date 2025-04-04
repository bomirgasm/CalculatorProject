//
//  CalculatorLogic.swift
//  CalculatorProject
//
//  Created by Suzie Kim on 4/4/25.
//

import Foundation

class CalculatorLogic {
    // 현재 수식 문자열
    private(set) var expression: String = "0"

    // 수식에 항 추가
    func append(_ value: String) {
        if expression == "0" {            // 기본값이 0일 때 숫자가 들어오면 0을 제거
            expression = value
        } else {
            expression += value
        }
    }
    /*//Lv8 계산 기능
    func calculate() -> String {
        let exp = NSExpression(format: expression)
        if let result = exp.expressionValue(with: nil, context: nil) as? NSNumber {
            return result.stringValue
        } else {
            return "Error"
        }
    }*/
    
    //Lv6 AC 함수
    func clear() {
        expression = "0"
    }
}
