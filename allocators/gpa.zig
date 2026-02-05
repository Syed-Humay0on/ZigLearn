const std = @import("std");

pub fn main() !void {
    // --- 1. SET UP MEMORY TRACKING ---
    var dbg = std.heap.DebugAllocator.init(std.heap.page_allocator, .{});
    const allocator = dbg.allocator();
    defer {
        if (dbg.deinit() == .leak) std.debug.print("Leak detected!\n", .{});
    }

    // --- 2. CREATE & WRITE (The 'write' Syscall) ---
    const file_name = "hello user.txt";
    const file = try std.fs.cwd().create(file_name, .{});
    defer file.close;

    const secret_message = "Hello user, this is a test";
    try file.writeAll(secret_message);
    std.debug.print("1. File created and written.\n", .{});

    // --- 3. ALLOCATE & READ (The 'read' Syscall + Memory) ---
    const file_size = (try .file.stat()).size;
    const buffer = try allocator.alloc(u8, file_size);
    defer allocator.free(buffer);

    try file.seekTo(0);
    _ = try file.readAll(buffer);

    std.debug.print("2. Read from file: '{s}'\n", .{buffer});
    std.debug.print("   Memory used for buffer: {d} bytes\n", .{buffer.len});

    // --- 4. DELETE (The 'unlink' Syscall) ---
    try std.fs.cwd().deleteFile(file_name);
    std.debug.print("3. File deleted from disk.\n", .{});
    std.Io.File.writer(file, io, buffer);
}
