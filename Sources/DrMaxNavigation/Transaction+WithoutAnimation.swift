// ===----------------------------------------------------------------------===//
//
// This source file is part of the DrMaxNavigation open source project
//
// Copyright (c) 2026 Dr. Max BDC, s.r.o. and the DrMaxNavigation project authors
// Licensed under The MIT License (MIT)
//
// See LICENSE.md for license information
// See CONTRIBUTORS.md for the list of DrMaxNavigation project authors
//
// ===----------------------------------------------------------------------===//

import SwiftUI

extension Transaction {
    /// Executes a body of code without animations.
    /// - Parameter body: The code to execute.
    /// - Returns: The result of the body.
    public static func withoutAnimation<Result>(body: () throws -> Result) rethrows -> Result {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        return try withTransaction(transaction, body)
    }

    /// Conditionally executes a body of code with or without animations.
    /// - Parameters:
    ///   - animated: Whether to use animations.
    ///   - body: The code to execute.
    ///   - completion: A closure to execute after the transaction finishes.
    /// - Returns: The result of the body.
    @discardableResult
    static func conditionalyDisableAnimations<Result>(
        animated: Bool,
        body: () throws -> Result,
        completion: @escaping () -> Void
    ) rethrows -> Result {
        if animated {
            return try withAnimation {
                try body()
            } completion: {
                completion()
            }
        } else {
            return try withoutAnimation(body: body)
        }
    }
}
