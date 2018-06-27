.assembly test {}
.assembly extern mscorlib {}

.method public static void println_func(int32 val) {
    ldarg.0
    call void [mscorlib]System.Console::WriteLine(int32)
    ret
}

.method public static int32 add_func(int32 a_param, int32 b_param) {
    .maxstack 10000
    .locals init (int32 a_at_2, int32 b_at_2)
    ldarg a_param
    stloc a_at_2
    ldarg b_param
    stloc b_at_2
    ldloc a_at_2
    ldloc b_at_2
    add
    ret
    ret
}

.method public static int32 mul_func(int32 a_param, int32 b_param) {
    .maxstack 10000
    .locals init (int32 a_at_4, int32 b_at_4)
    ldarg a_param
    stloc a_at_4
    ldarg b_param
    stloc b_at_4
    ldloc a_at_4
    ldloc b_at_4
    mul
    ret
    ret
}

.method public static int32 square_func(int32 x_param) {
    .maxstack 10000
    .locals init (int32 x_at_6)
    ldarg x_param
    stloc x_at_6
    ldloc x_at_6
    ldloc x_at_6
    mul
    ret
    ret
}

.method public static int32 factorial_func(int32 x_param) {
    .maxstack 10000
    .locals init (int32 x_at_8)
    ldarg x_param
    stloc x_at_8
        // evaluate if expr
    ldloc x_at_8
    ldc.i4 1
    cgt
    // made the inverse comparison
    // simulate !
    ldc.i4 0
    ceq
    brtrue IF_1_TRUE
    br IF_1_FALSE
    IF_1_TRUE:
        ldc.i4 1
        ret
        br IF_1_END
    IF_1_FALSE:
        ldloc x_at_8
        ldloc x_at_8
        ldc.i4 1
        sub
        call int32 factorial_func(int32)
        mul
        ret
        br IF_1_END
    IF_1_END:
    ret
}

.method public static int32 fibonacci_func(int32 x_param) {
    .maxstack 10000
    .locals init (int32 x_at_12)
    ldarg x_param
    stloc x_at_12
        // evaluate if expr
    ldloc x_at_12
    ldc.i4 1
    cgt
    // made the inverse comparison
    // simulate !
    ldc.i4 0
    ceq
    brtrue IF_2_TRUE
    br IF_2_FALSE
    IF_2_TRUE:
        ldloc x_at_12
        ret
        br IF_2_END
    IF_2_FALSE:
        ldloc x_at_12
        ldc.i4 2
        sub
        call int32 fibonacci_func(int32)
        ldloc x_at_12
        ldc.i4 1
        sub
        call int32 fibonacci_func(int32)
        add
        ret
        br IF_2_END
    IF_2_END:
    ret
}

.method public static int32 fibonorial_func(int32 x_param) {
    .maxstack 10000
    .locals init (int32 x_at_16)
    ldarg x_param
    stloc x_at_16
        // evaluate if expr
    ldloc x_at_16
    ldc.i4 0
    ceq
    brtrue IF_3_TRUE
    br IF_3_FALSE
    IF_3_TRUE:
        ldc.i4 1
        ret
        br IF_3_END
    IF_3_FALSE:
        ldloc x_at_16
        call int32 fibonacci_func(int32)
        ldloc x_at_16
        ldc.i4 1
        sub
        call int32 fibonorial_func(int32)
        mul
        ret
        br IF_3_END
    IF_3_END:
    ret
}

.method public static int32 max_func(int32 a_param, int32 b_param) {
    .maxstack 10000
    .locals init (int32 nmax_at_21, int32 a_at_20, int32 b_at_20)
    ldarg a_param
    stloc a_at_20
    ldarg b_param
    stloc b_at_20
    ldloc b_at_20
    stloc nmax_at_21
        // evaluate if expr
    ldloc a_at_20
    ldloc b_at_20
    cgt
    brtrue IF_4_TRUE
    br IF_4_FALSE
    IF_4_TRUE:
        ldloc a_at_20
        stloc nmax_at_21
        br IF_4_END
    IF_4_FALSE:
        nop
        br IF_4_END
    IF_4_END:
    ldloc nmax_at_21
    ret
    ret
}

.method public static int32 even_func(int32 n_param) {
    .maxstack 10000
    .locals init (int32 n_at_23)
    ldarg n_param
    stloc n_at_23
    ldloc n_at_23
    ldloc n_at_23
    ldc.i4 2
    div
    ldc.i4 2
    mul
    sub
    ret
    ret
}

.method public static int32 collatz_func(int32 n_param) {
    .maxstack 10000
    .locals init (int32 n_at_25)
    ldarg n_param
    stloc n_at_25
        // evaluate if expr
    ldloc n_at_25
    ldc.i4 1
    ceq
    brtrue IF_5_TRUE
    br IF_5_FALSE
    IF_5_TRUE:
        ldc.i4 1
        ret
        br IF_5_END
    IF_5_FALSE:
            // evaluate if expr
        ldloc n_at_25
        call int32 even_func(int32)
        ldc.i4 0
        ceq
        brtrue IF_6_TRUE
        br IF_6_FALSE
        IF_6_TRUE:
            ldc.i4 1
            ldloc n_at_25
            ldc.i4 2
            div
            call int32 collatz_func(int32)
            add
            ret
            br IF_6_END
        IF_6_FALSE:
            ldc.i4 1
            ldc.i4 3
            ldloc n_at_25
            mul
            ldc.i4 1
            add
            call int32 collatz_func(int32)
            add
            ret
            br IF_6_END
        IF_6_END:
        br IF_5_END
    IF_5_END:
    ret
}

.method public static void main_func() {
    .entrypoint
    .maxstack 10000
    .locals init (int32 fbr_at_31, int32 sum_at_31, int32 x_at_31, int32 sqrSum_at_31, int32 fat_at_31, int32 y_at_31, int32 ctz_at_31)
    ldc.i4 2
    stloc x_at_31
    ldc.i4 3
    stloc y_at_31
    ldloc x_at_31
    call void println_func(int32)
    ldloc y_at_31
    call void println_func(int32)
    ldloc x_at_31
    ldloc y_at_31
    call int32 add_func(int32, int32)
    stloc sum_at_31
    ldloc sum_at_31
    call void println_func(int32)
    ldloc x_at_31
    call int32 square_func(int32)
    ldc.i4 2
    ldloc x_at_31
    ldloc y_at_31
    call int32 mul_func(int32, int32)
    call int32 mul_func(int32, int32)
    ldloc y_at_31
    call int32 square_func(int32)
    call int32 add_func(int32, int32)
    call int32 add_func(int32, int32)
    stloc sqrSum_at_31
    ldloc sqrSum_at_31
    call void println_func(int32)
    ldloc sum_at_31
    call int32 factorial_func(int32)
    stloc fat_at_31
    ldloc sum_at_31
    call int32 fibonorial_func(int32)
    stloc fbr_at_31
    ldloc sum_at_31
    call int32 collatz_func(int32)
    stloc ctz_at_31
    ldloc fat_at_31
    ldloc fbr_at_31
    call int32 max_func(int32, int32)
    call void println_func(int32)
    ldloc fat_at_31
    ldloc ctz_at_31
    call int32 max_func(int32, int32)
    call void println_func(int32)
    ldloc fbr_at_31
    ldloc ctz_at_31
    call int32 max_func(int32, int32)
    call void println_func(int32)
    ret
}
