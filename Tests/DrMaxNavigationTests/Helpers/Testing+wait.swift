import Testing

func wait(
    _ timeout: Duration,
    _ comment: Comment? = nil,
    expectedCount: Int = 1,
    fileID: String = #fileID,
    filePath: String = #filePath,
    line: Int = #line,
    column: Int = #column,
    for expectation: @escaping @autoclosure () -> Bool
) async {
    let startTime = ContinuousClock.now
    var fulfilled = false
    
    await confirmation(
        comment,
        expectedCount: expectedCount,
        sourceLocation: SourceLocation(fileID: fileID, filePath: filePath, line: line, column: column)
    ) { confirm in
        while !fulfilled && ContinuousClock.now - startTime < timeout {
            if expectation() {
                fulfilled = true
                confirm()
                break
            }
            await Task.yield()
        }
        
        if !fulfilled {
            Issue.record("Timeout")
        }
    }
}
