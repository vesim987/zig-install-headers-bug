const std = @import("std");
pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "lib",
        .root_source_file = .{ .path = "src/lib.zig" },
        .target = target,
        .optimize = optimize,
    });

    lib.installHeadersDirectoryOptions(.{
        .source_dir = .{ .path = "src/include" },
        .install_dir = .header,
        .install_subdir = "",
    });

    const mod = b.addModule("mod", .{
        .root_source_file = .{ .path = "src/mod.zig" },
        .target = target,
        .optimize = optimize,
    });
    mod.linkLibrary(lib);
}
