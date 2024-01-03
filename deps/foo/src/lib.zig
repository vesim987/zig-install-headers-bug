const std = @import("std");

export fn foo() void {
    std.debug.print("foo()\n", .{});
}
