const std = @import("std");

fn buildGreeting(allocator: std.mem.Allocator, name: []const u8) ![]u8 {
    const prefix = "Hello, ";
    const prefix_len = prefix.len; // 7

    const total_len = prefix_len + name.len + 1; // +1 for '!'

    var result = try allocator.alloc(u8, total_len);

    @memcpy(result[0..prefix_len], prefix);
    @memcpy(result[prefix_len .. prefix_len + name.len], name);
    result[total_len - 1] = '!';

    return result;
}

pub fn main() !void {

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();

    const alloc = gpa.allocator();
    //Pass the allocator to the function
    const greeting = try buildGreeting(alloc, "Zig");
    defer alloc.free(greeting);
    std.debug.print("{s}\n", .{greeting});
    
}
