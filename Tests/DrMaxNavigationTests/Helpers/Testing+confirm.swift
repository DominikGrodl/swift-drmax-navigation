import Testing

func confirm(
    timeout: Duration = .seconds(1),
    comment: Comment? = nil,
    fileID: String = #fileID,
    filePath: String = #filePath,
    line: Int = #line,
    column: Int = #column,
    _ operation: (@escaping () -> Void) -> Void
) async {
    await confirmation(
        comment,
        sourceLocation: SourceLocation(
            fileID: fileID,
            filePath: filePath,
            line: line,
            column: column
        )
    ) { confirm in
        var fulfilled = false
        
        operation {
            fulfilled = true
            confirm()
        }
        
        let startTime = ContinuousClock.now
        
        while !fulfilled && ContinuousClock.now - startTime < timeout {
            await Task.yield()
        }
    }
}
