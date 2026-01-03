const std = @import("std");

const Custom_error = error{Invalid};

pub fn main() !void {
    const result = Divide(10, 0) catch |err| {
        if (err == Custom_error.Invalid) {
            std.debug.print("Error: Cannot divide with 0!\n", .{});
            return;
        }
        return;
    };
    std.debug.print("Result: {}\n", .{result});
}

fn Divide(x: u8, y: u8) Custom_error!u8 {
    if (y == 0) {
        return Custom_error.Invalid;
    }
    const calc = x / y;
    return calc;
}
