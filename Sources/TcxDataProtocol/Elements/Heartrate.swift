//
//  Heartrate.swift
//  TcxDataProtocol
//
//  Created by Kevin Hoogheem on 12/29/18.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

/// TCX Heart Rate in BPM
@available(swift 4.0)
public struct HeartRateInBeatsPerMinute {
    // HeartRateInBeatsPerMinute_t

    /// Heart Rate
    // HeartRateValue_t
    private(set) public var heartRate: UInt8

    public init(heartRate: UInt8) {
        self.heartRate = heartRate
    }
}

extension HeartRateInBeatsPerMinute: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HeartRateInBeatsPerMinute, rhs: HeartRateInBeatsPerMinute) -> Bool {
        return (lhs.heartRate == rhs.heartRate)
    }
}

extension HeartRateInBeatsPerMinute: Hashable {
    
    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.heartRate)
    }
}

@available(swift 4.0)
extension HeartRateInBeatsPerMinute: Codable {

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        case heartRate = "Value"
    }
}

/// TCX Heart Rate in BPM
@available(swift 4.0)
public struct HeartRateInBeatsPercentMax {
    // HeartRateAsPercentOfMax_t

    /// Heart Rate
    ///
    /// - note: Bound from 0 to 100%
    private(set) public var heartRate: UInt8

    public init(heartRate: UInt8) {
        self.heartRate = min(heartRate, 100)
    }
}

extension HeartRateInBeatsPercentMax: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: HeartRateInBeatsPercentMax, rhs: HeartRateInBeatsPercentMax) -> Bool {
        return (lhs.heartRate == rhs.heartRate)
    }
}

extension HeartRateInBeatsPercentMax: Hashable {
    
    /// Hashes the essential components of this value by feeding them into the
    /// given hasher.
    ///
    /// Implement this method to conform to the `Hashable` protocol. The
    /// components used for hashing must be the same as the components compared
    /// in your type's `==` operator implementation. Call `hasher.combine(_:)`
    /// with each of these components.
    ///
    /// - Important: Never call `finalize()` on `hasher`. Doing so may become a
    ///   compile-time error in the future.
    ///
    /// - Parameter hasher: The hasher to use when combining the components
    ///   of this instance.
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.heartRate)
    }
}

@available(swift 4.0)
extension HeartRateInBeatsPercentMax: Codable {

    /// Coding Keys
    public enum CodingKeys: String, CodingKey {
        case heartRate = "Value"
    }
}
