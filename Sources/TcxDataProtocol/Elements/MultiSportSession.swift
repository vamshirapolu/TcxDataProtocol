//
//  MultiSportSession.swift
//  TcxDataProtocol
//
//  Created by Kevin Hoogheem on 1/1/19.
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

/// TCX Multi Sport Session
@available(swift 4.0)
public struct MultiSportSession {
    // MultiSportSession_t

    /// Session ID
    private(set) public var identification: Date

    /// First Sport
    private(set) public var firstSport: Activity

    /// Next Sport
    private(set) public var nextSport: [NextSport]?

    /// Notes
    private(set) public var notes: String?

    public init(identification: Date,
                firstSport: Activity,
                nextSport: [NextSport]?,
                notes: String?)
    {
        self.identification = identification
        self.firstSport = firstSport
        self.nextSport = nextSport
        self.notes = notes
    }
}

extension MultiSportSession: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (lhs: MultiSportSession, rhs: MultiSportSession) -> Bool {
        return (lhs.identification == rhs.identification) &&
            (lhs.firstSport == rhs.firstSport) &&
            (lhs.nextSport == rhs.nextSport) &&
            (lhs.notes == rhs.notes)
    }
}

extension MultiSportSession: Hashable {
    
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
        hasher.combine(self.identification)
        hasher.combine(self.firstSport)
        hasher.combine(self.nextSport)
        hasher.combine(self.notes)
    }
}

@available(swift 4.0)
extension MultiSportSession: Codable {

    /// Coding Keys
    enum CodingKeys: String, CodingKey {
        // xsd:dateTime
        case identification = "Id"
        case firstSport = "FirstSport"
        case nextSport = "NextSport"
        case notes = "Notes"
    }
}
