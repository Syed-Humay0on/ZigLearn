const std = @import("std");

pub fn main() void {
    const x = floated(32.000);
    std.debug.print("Float value: {d}\n",.{x});
}

fn floated(flt: f16) f16 {
    return flt;
}
