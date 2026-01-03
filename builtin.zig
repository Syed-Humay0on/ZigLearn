const print = @import("std").debug.print;

pub fn main() void {
    const a: u4 = 0b1101;
    const b: u4 = 0b0101;
    const my_result = @addWithOverflow(a, b);

    // Check out our fancy formatting! b:0>4 means, "print
    // as a binary number, zero-pad right-aligned four digits."
    // The print() below will produce: "1101 + 0101 = 0010 (true)".
    print("{b:0>4} + {b:0>4} = {b:0>4} ({s})", .{ a, b, my_result[0], if (my_result[1] == 1) "true" else "false" });
    const expected_result: u8 = 0b10010;
    print(". Without overflow: {b:0>8}. ", .{expected_result});

    print("Furthermore, ", .{});
    // Here's a fun one:
    //
    //   @bitReverse(integer: anytype) T
    //     * 'integer' is the value to reverse.
    //     * The return value will be the same type with the
    //       value's bits reversed!
    //
    // Now it's your turn. See if you can fix this attempt to use
    // this builtin to reverse the bits of a u8 integer.
    const input: u8 = 0b01110001;
    const tupni: u8 = @bitReverse(input);
    print("{b:0>8} backwards is {b:0>8}.\n", .{ input, tupni });
}

