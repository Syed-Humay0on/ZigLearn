const std = @import("std");
const Io = std.Io; // Note the capital I

pub fn main() !void {
    // In the new world, we often use 'any_writer' 
    // or specific IO types that implement the new interface.
    const stdout = std.fs.File{ .handle = std.posix.STDOUT_FILENO };
    try stdout.writeAll("Hello from the new std.IO world\n");
}
