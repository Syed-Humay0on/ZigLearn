const std = @import("std");

fn cookOnions(id: u32) void {
    std.debug.print("Chef {d} started chopping onions...\n", .{id});
    std.posix.sleep(1 * std.time.ns_per_s); // Simulate work
    std.debug.print("Chef {d} finished!\n", .{id});
}

pub fn main() !void {
    std.debug.print("Main kitchen opened.\n", .{});

    // Spawn a second thread (Chef 2)
    const thread = try std.Thread.spawn(.{}, cookOnions, .{2});

    // Main thread (Chef 1) does work immediately
    cookOnions(1);

    // Wait for Chef 2 to finish before closing the kitchen
    thread.join();

    std.debug.print("All chefs done. Kitchen closed.\n", .{});
}
