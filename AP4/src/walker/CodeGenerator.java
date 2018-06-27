package walker;

import java.util.Set;
import java.util.HashSet;

public class CodeGenerator {
  private StringBuffer code;
  private String returnType;
  private Set<Variable> declareVariables;

  public CodeGenerator() {
    this.code = new StringBuffer();
    this.returnType = Type.INT;
    this.declareVariables = new HashSet<Variable>();
  }

  public String getCode() {
    return this.code.toString();
  }

  public String getDeclaredVariablesList() {
    StringBuffer ret = new StringBuffer();
    boolean first = true;
    for (Variable v : declareVariables) {
      if (!first) {
        ret.append(", ");
      }
      first = false;
      ret.append(v.getType() + " " + v.getName());
    }
    return ret.toString();
  }

  public Set<Variable> getDeclaredVariables() {
    return this.declareVariables;
  }

  public String getReturnType() {
    return this.returnType;
  }
  
  public void declareVariable(Variable v) {
    this.declareVariables.add(v);
  }

  public void declareVariables(Set<Variable> vs) {
    this.declareVariables.addAll(vs);
  }

  public void addCode(String newCode, int indentationLevel) {
    for (int i = 0; i < 4 * indentationLevel; i++) code.append(" ");
    code.append(newCode);
    code.append("\n");
  }

  public void appendCode(String newCode) {
    code.append(newCode);
  }

  public void clearVariables() {
    this.declareVariables.clear();
  }
  
  public void setReturnType(String type) {
    this.returnType = type;
  }

  public void aggregate(CodeGenerator next) {
    this.code.append(next.getCode());
    if (this.returnType.equals(Type.VOID)) {
      this.returnType = next.getReturnType();
    }
    this.declareVariables.addAll(next.getDeclaredVariables());
  } 

}