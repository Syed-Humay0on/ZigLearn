const std = @import("std");

pub fn main() void {
    const @"55_what the hell": i32 = 55;
    std.debug.print("what the hell even is that: {d}\n", .{@"55_what the hell"});
}
