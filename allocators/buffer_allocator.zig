const std = @import("std");

pub fn main() !void {
    var buffer: [1024]u8 = undefined;
    // Create a tiny heap inside out stack buffer
    var fba = std.heap.FixedBufferAllocator.init(&buffer);
    const alloc = fba.allocator();

    //Now we use it like a normal allocator
    const name = try alloc.alloc(u8, 13);
    defer alloc.free(name);

    @memcpy(name, "Fixed Buffer!");
    std.debug.print("-> {s}\n", .{name});

}
