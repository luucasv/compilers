.assembly test {}
.assembly extern mscorlib {}

.method public static int32 main_func() {
    .entrypoint
    .maxstack 10000
    .locals init (int32 x_at_3)
    ldc.i4 1
    stloc x_at_3
    ldloc x_at_3
    ldc.i4 1
    ceq
    brtrue IF_1_TRUE
    br IF_1_FALSE
    IF_1_TRUE:
        ldc.i4 1
        call void println_func(int32)
        br IF_1_END
    IF_1_FALSE:
        ldc.i4 0
        call void println_func(int32)
        br IF_1_END
    IF_1_END:
    ldc.i4 0
    ret
}

.method public static int32 temp( ) {
    ldc.i4 10
    ret
}

.method public static void println_func(int32 val) {
    ldarg.0
    call void [mscorlib]System.Console::WriteLine(int32)
    ret
}
