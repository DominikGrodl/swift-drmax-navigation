func reportUnimplemented(
    _ value: Any,
    file: StaticString = #file,
    line: Int = #line
) {
    precondition(
        false,
        "Delegate sent an action but is not implemented in the parent. File: \(file), line: \(line)."
    )
}

func reportUnimplemented(
    file: StaticString = #file,
    line: Int = #line
) {
    precondition(
        false,
        "Delegate sent an action but is not implemented in the parent. File: \(file), line: \(line)."
    )
}
