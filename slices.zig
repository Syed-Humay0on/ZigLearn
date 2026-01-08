const std = @import("std");

pub fn main() void {
        var foo = [4]u8{ 1, 2, 3, 4 };
        // const foo_slice: []u8 = foo[1..];
        const foo_ptr: [*]u8 = &foo;
        // const foo_slice_from_pto_ptr[0..4];
        const third_val = (foo_ptr + 2).*;
        std.debug.print("Pointer stores values: {}\n", .{third_val});
}

