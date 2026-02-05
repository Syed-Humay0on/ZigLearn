const std = @import("std");

pub fn main() !void {
    const target = @import("builtin").target;
    std.debug.print("Target OS: {s}\n", .{@tagName(target.os.tag)});
    
    // Check for standard POSIX file descriptors
    std.debug.print("Standard Input FD: {d}\n", .{std.posix.STDIN_FILENO});
}
