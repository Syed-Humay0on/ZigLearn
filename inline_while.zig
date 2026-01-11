const std = @import("std");

pub fn main() void {
    // 1. Our "source" data (this stays at the factory, doesn't go in the box)
    const inputs = "123";

    // 2. Our runtime variable (this is the actual counter in the program)
    var result: u32 = 0;

    // 3. Our "Cursor" (only exists while the compiler is building)
    comptime var i = 0;

    inline while (i < inputs.len) : (i += 1) {
        // This line is written into your program 3 times!
        // result += (inputs[i] - '0');
        const val = (inputs[i] - '0');
        // This is the "Ghost Talk"
        // It will show up in your terminal BEFORE the program runs.
        @compileLog("Compiler unrolling loop for index", i, "value", val);
        result += val;
    }
    std.debug.print("Result: {}", .{result});
}

// Understanding the Syntax: The "Ghost" vs. The "Real"

// Think of the code above as a Script that writes Code.
// The "Ghost" Variables (comptime)

// inputs and i are "ghosts." They are used by the compiler to decide what to write.

//     inputs is the map.

//     i is the finger pointing at the map.

//     Once the compiler is done, these ghosts disappear. They take up zero bytes in your final .exe.

// The "Real" Variables (var)

// result is "real." It will exist in your computer's RAM when you double-click the program.
// What the Compiler "Spits Out"

// Because of the inline keyword, the compiler looks at that loop and essentially "copy-pastes" the inside for every step of i.
// This is what your final program actually looks like after compilation:

// -----------------------------------------
// // Step 1 (i=0):
// result += 1;

// Step 2 (i=1):
// result += 2;

// Step 3 (i=2):
// result += 3;

// The print statement
// print("Result: {}\n", .{result});
// ------------------------------------------

// Why (i += 1) is in the header?

// The syntax inline while (condition) : (step) is just Zig's way of keeping things organized.

//     condition: "Should I keep writing more code?"

//     step: "Move my ghost-finger to the next spot on the map."

// Let's try to break it

// To really "get" it, try this in your file: Change the loop to i += 2.

// What happens?

//     i starts at 0. Compiler writes result += 1.

//     i jumps to 2. Compiler writes result += 3.

//     i jumps to 4. 4 is bigger than the string length (3). Loop stops.

// The final result will be 4 (1+3) because the compiler skipped the number 2 at index 1!
