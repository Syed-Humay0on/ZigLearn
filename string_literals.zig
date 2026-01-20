const std = @import("std");

pub fn main() void {
    var str: []const u8 = "Hello";
    str = "Humayoon";
    std.debug.print("string lenght: {}\n", .{str.len});
}
