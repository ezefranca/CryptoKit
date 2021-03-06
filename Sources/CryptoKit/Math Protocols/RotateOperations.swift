//
//  RotateOperations.swift
//  CryptoKit
//
//  Created by Chris Amanse on 31/08/2016.
//
//

import Foundation

infix operator <<< : BitwiseShiftPrecedence
infix operator >>> : BitwiseShiftPrecedence

public protocol RotateOperations {
    static func <<<(lhs: Self, rhs: Self) -> Self
    static func >>>(lhs: Self, rhs: Self) -> Self
}

extension UInt8: RotateOperations {}
extension Int8: RotateOperations {}
extension UInt16: RotateOperations {}
extension Int16: RotateOperations {}
extension UInt32: RotateOperations {}
extension Int32: RotateOperations {}
extension UInt64: RotateOperations {}
extension Int64: RotateOperations {}
extension UInt: RotateOperations {}
extension Int: RotateOperations {}

public extension RotateOperations where Self: ShiftOperations & BitwiseOperations & ExpressibleByInt & IntegerArithmetic {
    public static func <<<(lhs: Self, rhs: Self) -> Self {
        guard rhs != Self(0) else {
            return lhs
        }
        
        let size = Self(MemoryLayout<Self>.size * 8)
        
        return (lhs << rhs) | (lhs >> (size - rhs))
    }
    
    public static func >>>(lhs: Self, rhs: Self) -> Self {
        guard rhs != Self(0) else {
            return lhs
        }
        
        let size = Self(MemoryLayout<Self>.size * 8)
        
        return (lhs >> rhs) | (lhs << (size - rhs))
    }
}
