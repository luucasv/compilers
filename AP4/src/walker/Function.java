package walker;

import java.util.Iterator;
import java.util.List;

public class Function {
  private String name, returnType;
  private List<String> params;

  public Function(String name, List<String> params, String returnType) {
    this.name = name + "_func";
    this.params = params;
    this.returnType = returnType;
  }

  public String getName() {
    return this.name;
  }

  public String getSignature() {
    return this.getName() + "(" + String.join(", ", this.params) + ")"; 
  }

  public String getCompleteSignature() {
    return this.returnType + " " + this.getSignature();
  }

  public String getCompleteSignature(List<String> names) {
    StringBuffer ret = new StringBuffer();
    Iterator<String> it1 = names.iterator(), it2 = params.iterator();
    boolean first = true;
    ret.append(this.returnType + " " + this.getName() + "(");
    while (it1.hasNext() && it2.hasNext()) {
      if (!first) {
        ret.append(", ");
      }
      first = false;
      ret.append(it2.next() + " " + it1.next());
    }
    ret.append(")");
    return ret.toString();
  }

  public String getReturnType() {
    return this.returnType;
  }

  public void setReturnType(String returnType) {
    this.returnType = returnType;
  }
}