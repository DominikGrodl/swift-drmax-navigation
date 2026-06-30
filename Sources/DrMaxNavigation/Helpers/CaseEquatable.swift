import CasePaths

public protocol CaseEquatable {
    func equals(_ another: Self) -> Bool
}

extension CaseEquatable where Self: CasePathable, AllCasePaths: CasePathReflectable, AllCasePaths.Root == Self {
    public func equals(_ another: Self) -> Bool {
        Self.allCasePaths[self] == Self.allCasePaths[another]
    }
}
