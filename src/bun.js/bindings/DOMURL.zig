pub const DOMURL = opaque {
    pub extern fn WebCore__DOMURL__cast_(JSValue0: JSValue, arg1: *VM) ?*DOMURL;

    pub fn cast_(value: JSValue, vm: *VM) ?*DOMURL {
        return WebCore__DOMURL__cast_(value, vm);
    }

    pub fn cast(value: JSValue) ?*DOMURL {
        return cast_(value, jsc.VirtualMachine.get().global.vm());
    }

    pub fn href_(this: *DOMURL, out: *ZigString) void {
        return bun.cpp.WebCore__DOMURL__href_(this, out);
    }

    pub fn href(this: *DOMURL) ZigString {
        var out = ZigString.Empty;
        this.href_(&out);
        return out;
    }

    extern fn WebCore__DOMURL__fileSystemPath(arg0: *DOMURL, error_code: *c_int) bun.String;
    pub const ToFileSystemPathError = error{
        NotFileUrl,
        InvalidPath,
        InvalidHost,
    };
    pub fn fileSystemPath(this: *DOMURL) ToFileSystemPathError!bun.String {
        var error_code: c_int = 0;
        const path = WebCore__DOMURL__fileSystemPath(this, &error_code);
        switch (error_code) {
            1 => return ToFileSystemPathError.InvalidHost,
            2 => return ToFileSystemPathError.InvalidPath,
            3 => return ToFileSystemPathError.NotFileUrl,
            else => {},
        }
        bun.assert(path.tag != .Dead);
        return path;
    }

    pub fn pathname_(this: *DOMURL, out: *ZigString) void {
        return bun.cpp.WebCore__DOMURL__pathname_(this, out);
    }

    pub fn pathname(this: *DOMURL) ZigString {
        var out = ZigString.Empty;
        this.pathname_(&out);
        return out;
    }
};

const bun = @import("bun");
const String = bun.String;

const jsc = bun.jsc;
const JSValue = jsc.JSValue;
const VM = jsc.VM;
const ZigString = jsc.ZigString;
