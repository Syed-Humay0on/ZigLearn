const std = @import("std");

pub fn Hello(string: []const u8) []const u8 {
    return string;
}

pub fn main() void {
    const user: []const u8 = "Checkmate"; 
    std.debug.print("{s} {s}\n", .{Hello("Hello"), user});
}
