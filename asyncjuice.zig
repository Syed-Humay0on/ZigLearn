const std = @import("std");
const Io = std.Io;
const Allocator = std.mem.Allocator;
const assert = std.debug.assert;

fn JuicyMain(gpa: Allocator, io: Io) !void {
    _ = gpa;

    var a = io.async(doWork, .{ io, "hard" });
    var b = io.async(doWork, .{ io, "on an excuse not to drink coke" });

    a.await(io);
    b.await(io);
}

fn doWork(io: Io, flavour_text: []const u8) void {
    std.debug.print("working {s}\n", .{flavour_text});
    io.sleep(.fromSeconds(1), .awake) catch {};
}

pub fn main() !void {
    //set up Allocator
    var debug_allocator: std.heap.DebugAllocator(.{}) = .init;
    defer assert(debug_allocator.deinit() == .ok);
    const gpa = debug_allocator.allocator();
    //Set up our Io implementations
    var threaded: std.Io.Threaded = .init(gpa);
    defer threaded.deinit();
    const io = threaded.io();

    return JuicyMain(gpa, io);
}
