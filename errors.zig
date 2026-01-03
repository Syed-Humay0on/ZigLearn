const std = @import("std");

const Error = error {
    EmptyInput,
    InvalidNumber,
};

fn parseNumber(s: []const u8) !u32 {
    if (s.len == 0) return Error.EmptyInput;
    return std.fmt.parseInt(u32,s, 10)
        catch Error.InvalidNumber;
}

pub fn main() !void {
    const answer = parseNumber("42") catch 0;
    const result = try parseNumber("abc") catch 999;
    std.debug.print("answer: {} result: {}\n", .{answer, result});
}
