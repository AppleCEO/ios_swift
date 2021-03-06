//
//  Convertor.swift
//  STEP_1-1_NAND_GATE_SWIFT
//
//  Created by hw on 07/05/2019.
//  Copyright © 2019 hwj. All rights reserved.
//

import Foundation
/*
 0부터 256 미만의 Int 정수형 10진수를 [Bool] 2진수 배열로 변환하는 dex2bin 함수를 구현
 - 사칙연산만으로 변환하는 방식을 구현
 - 만들어지는 비트 순서는 낮은 자리가 배열의 앞쪽에 오도록 표현한다. 배열의 순서대로 보면 이진수가 뒤집혀 있는 것처럼 보인다고 가정
 이진수 1100 = [ 0, 0, 1, 1 ] 이진수 0101 = [ 1, 0, 1, 0 ]
 입력  = 10
 결과 = [0, 1, 0, 1]
 
 입력  = 173
 결과 = [1,0,1,1,0,1,0,1]
 */
struct Convertor{
    static func dec2bin(_ decimal: Int ) -> [Bool]{
        var divisor = 256
        var decimalNumber = decimal
        var result = [Bool]()
        while divisor >= 1 && decimalNumber >= 0{
            if (decimalNumber < divisor ){
                result.append(false)
            }else{
                decimalNumber = decimalNumber - divisor
                result.append(true)
            }
            divisor /= 2
        }
        
        let binaryNumberResult = [Bool](result.reversed())
        return binaryNumberResult
    }
    
    static func bin2dec(_ binary : [Bool]) -> Int {
        var multiplyer = 1
        let result = binary.reduce(0, {(first: Int, second: Bool) -> Int in
            let sumValue = second == true ? first + multiplyer : first
            multiplyer = multiplyer * 2
            return sumValue
        })
        return result
    }
    
    static func bin2hex(_ binary: [Bool]) -> String{
        let decimalValue = bin2dec(binary)
        let hexValue = dec2hex(decimalValue)
        return hexValue
    }
    
    static func dec2hex( _ decimal : Int) -> String {
        var decimalValue = decimal
        var divisor = 256
        var result = "0x"
        while divisor >= 1 && decimalValue >= 0 {
            let div = decimalValue/divisor
            decimalValue -= div*divisor
            let hexDigit = appendHexCharacter(div)
            result.append(hexDigit)
            divisor /= 16
        }
        return result
    }
    
    static func hex2bin ( _ hex : String ) -> [Bool] {
        var multiplyer = 1
        var decimal = 0
        for element in hex.reversed() {
            let hexInteger = convertHexCharacterToInteger(String(element))
            decimal += hexInteger*multiplyer
            multiplyer *= 16
        }
        let result = dec2bin(decimal)
        return result
    }
    
    static func convertHexCharacterToInteger(_ hexCharacter : String) -> Int{
        switch hexCharacter {
        case "A" :
            return 10
        case "B":
            return 11
        case "C":
            return 12
        case "D":
            return 13
        case "E":
            return 14
        case "F":
            return 15
        default:
            return Int(hexCharacter) ?? 0
        }
    }
    static func appendHexCharacter(_ divider : Int) -> String{
        var hex = ""
        switch divider {
        case 10 :
            hex = "A"
        case 11 :
            hex = "B"
        case 12 :
            hex = "C"
        case 13 :
            hex = "D"
        case 14 :
            hex = "E"
        case 15:
            hex = "F"
        default:
            hex = String(divider)
        }
        return hex
    }
}
