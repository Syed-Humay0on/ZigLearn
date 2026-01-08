const std = @import("std");

pub fn main() void {
        var arr: [3]u8 = undefined;
        fill_array(&arr);
        std.debug.print("Populated Array: {any}\n", .{arr});
         
}

fn fill_array(dt: []u8) void{
    for (dt, 0..) | *item, i| {
        item.* = @intCast(i + 1);
    }
}

