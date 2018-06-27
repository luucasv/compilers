package walker;

import java.util.Map;
import java.util.HashMap;

public class FunctionManager {
  protected Map<String, Function> functionMap;

  public FunctionManager() {
    this.functionMap = new HashMap<String, Function>();
  }

  public void add(Function f) {
    this.functionMap.put(f.getSignature(), f);
  }

  public Function get(String functionSignature) {
    return this.functionMap.get(functionSignature);
  }

  public void aggregate(FunctionManager nextResult) {
    this.functionMap.putAll(nextResult.functionMap);
  }
}