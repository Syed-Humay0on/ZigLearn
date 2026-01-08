const std = @import("std");

const Error = error{OutofBound};

pub fn main() !void {
    var n: [3000]u8 = undefined;
    // n[299] = 15; manually adding value
    try setValue(&n, 2999, 50);

    std.debug.print("value inside array: {}\n", .{n[2999]});
}
fn setValue(arr: []u8, index: usize, value: u8) !void {
    if (index >= arr.len) {
        return Error.OutofBound; // Return the error box
    }
    arr[index] = value;
}
