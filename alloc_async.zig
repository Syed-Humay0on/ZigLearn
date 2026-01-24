const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    // Hold 5 int
    // "alloc" returns a slice (like a dynamic array)
    const my_list = try allocator.alloc(i32, 5);
    // 4. "defer" ensures the memory is given back when the function ends
    // This is the "golden rule" of Zig memory management
    defer allocator.free(my_list);

    for (my_list, 0..) |*item, i| {
        item.* = @intCast(i * 10);
    }
    std.debug.print("My Allocated list: {any}\n", .{my_list});
}
