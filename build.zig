const std = @import("std");
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const foo_def = b.dependency("foo", .{
        .target = target,
        .optimize = optimize,
    });

    const mod = foo_def.module("mod");

    const exe = b.addExecutable(.{
        .name = "exe",
        .root_source_file = .{ .path = "src/main.zig" },
        .target = target,
        .optimize = optimize,
    });
    exe.root_module.addImport("mod", mod);
    b.installArtifact(exe);
}
