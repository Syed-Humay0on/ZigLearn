const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const backing = gpa.allocator();

    var arena = std.heap.ArenaAllocator.init(backing);
    defer arena.deinit();

    const alloc = arena.allocator();

    var a = try alloc.alloc(u8, 50);
    var b = try alloc.alloc(u32, 200);
    var c = try alloc.dupe(u8, "temporary data");

    std.debug.print("sizes: {d}, {d}, {d}\n", .{a.len, b.len, c.len});
}
