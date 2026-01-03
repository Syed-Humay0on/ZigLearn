const std = @import("std");

pub fn main() void {
        var foo = [4]u8{ 1, 2, 3, 4 };
        // const foo_slice: []u8 = foo[1..];
        const foo_ptr: [*]u8 = &foo;
        // const foo_slice_from_pto_ptr[0..4];
        std.debug.print("Pointer stores: {*}\n", .{foo_ptr});
}
