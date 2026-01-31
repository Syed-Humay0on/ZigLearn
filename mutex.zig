const std = @import("std");
const Thread = std.Thread;

var shared_counter: i32 = 0;
var mutex = Thread.Mutex{};

fn worker() void {
    for (0..1000) |_| {
        mutex.lock();
        defer mutex.unlock();
        shared_counter += 1;
    }
}
pub fn main() !void {
    var threads: [10]std.Thread = undefined;

    // Start 10 threads
    for (&threads) |*t| {
        t.* = try std.Thread.spawn(.{}, worker, .{});
    }

    // Wait for all of them to finish
    for (threads) |t| {
        t.join();
    }

    std.debug.print("Final counter: {d}\n", .{shared_counter});
}
