const std = @import("std");

pub fn main() !void {
    // Max number to multiply
    const size = 15;

    // Print the header:
    //
    // We start with a single 'X' for the diagonal.
    std.debug.print("\n X |", .{});

    // Header row with all numbers from 1 to size.
    for (0..size) |n| {
        std.debug.print("{d:>3} ", .{n + 1});
    }
    std.debug.print("\n", .{});

    // Header column rule line.
    var n: u8 = 0;
    while (n <= size) : (n += 1) {
        std.debug.print("---+", .{});
    }
    std.debug.print("\n", .{});

    // Now the actual table. (Is there anything more beautiful
    // than a well-formatted table?)
    for (0..size) |a| {
        std.debug.print("{d:>2} |", .{a + 1});

        for (0..size) |b| {
            // What formatting is needed here to make our columns
            // nice and straight?
            std.debug.print("{d:>3} ", .{(a + 1) * (b + 1)});
        }

        // After each row we use double line feed:
        std.debug.print("\n\n", .{});
    }
}

