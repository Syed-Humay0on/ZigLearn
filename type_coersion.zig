const std = @import("std");

pub fn main() void {
    var arr: [4]u8 = [4]u8{ 1, 3, 5, 9 };
    var brr = [_]u8{'h', 'e', 'y'};
    std.debug.print("Tell her: {s}\n", .{&brr});
    const ptr_arr: ?*const [4]u8 = &arr;
    arr[3] = 10;
    std.debug.print("value inside array: {d}\n", .{ptr_arr.?.*[3]});
}
