const std = @import("std");

pub fn main() !void {
    var fixed: [32]u8 = undefined;
    @memcpy(fixed[0..10], "Hello Zig!");
    std.debug.print("stack says: {s}\n", .{fixed[0..10]});
}
