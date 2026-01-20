const std = @import("std");

pub fn main() void {
    var array = [5]u8{ 10, 20, 30, 40, 50 };

    // This slice starts at index 2 (the number 30)
    const slice = array[2..4];

    const addr_from_array = &array[0]; // Points to 10
    const addr_from_slice = &slice[0]; // Points to 30!}
    const elem_from_array = array[0]; // Points to 10
    const elem_from_slice = slice[0]; // Points to 30!}
    const length_of_slice = slice.len;
                                                  //
    std.debug.print("Addr of 1st elem of arr: {}\nAddr of 1st elem of slice: {}\n", .{addr_from_array, addr_from_slice});
    std.debug.print("1st Elem of arr: {}\n1st Elem of slice: {}\n", .{elem_from_array, elem_from_slice});
    std.debug.print("\nslice: {any}\nlenght of slice: {}\n", .{slice, length_of_slice});

}
