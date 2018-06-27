package walker;

public final class Type {
  static final String INT = "int32", VOID = "void";

  static public String convert(String name) {
    name = name.toLowerCase();
    if (name.equals("int")) {
      return INT;
    } else if (name.equals("void")) {
      return VOID;
    } else {
      assert(false);
    }
    return null;
  }
}