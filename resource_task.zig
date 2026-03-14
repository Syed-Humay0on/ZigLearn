const std = @import("std");

fn doWork(io: std.Io, id: usize) !void {
    _ = io;
    std.log.info("Task {} starting", .{id});
}

pub fn main(init: std.process.Init) !void {
    const io = init.io;

    var a = io.async(doWork, .{ io, 1 });
    defer a.cancel(io) catch {};  // Cleanup

    try a.await(io);  // Just a.await(io), not a.futex.await(io)
}

