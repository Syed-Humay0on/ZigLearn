const std = @import("std");

const MathError = error{NotEven};

pub fn main() void {
    var n: u8 = 254;
    const m: *u8 = getEvenPointer(&n) catch | err |{
        std.debug.print("Failed because {}\n", .{err});
            return;
};
    const o: u8 = m.*;

    std.debug.print("Success: Value is: {}\n", .{ o });
}
fn getEvenPointer(ptr: *u8) MathError!*u8 {
    if (ptr.* % 2 != 0) {
return MathError.NotEven;
    }
    return ptr;
}
