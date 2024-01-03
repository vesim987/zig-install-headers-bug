const c = @cImport({
    @cInclude("foo.h");
});

pub fn callFoo() void {
    c.foo();
}
