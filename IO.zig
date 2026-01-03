const std = @import("std");
const Io = std.Io; // Note the capital I

pub fn main() !void {
    // In the new world, we often use 'any_writer' 
    // or specific IO types that implement the new interface.
    const stdout_file = std.posix.STDOUT_FILENO;
    const stdout = std.fs.File{ .handle = stdout_file};
    try stdout.writeAll("Hello from the new std.IO world\n");
}
