package walker;

import java.util.HashMap;
import java.util.Map;
import java.util.Stack;
import java.util.List;
import java.util.LinkedList;

public class ScopeManager {
  private Map<String, Variable> symbolicTable;
  private Stack<Map<String, Variable>> deletedScopeStack;
  private Stack<List<String>> addedScopeStack;
  private int scopeCounter;

  public ScopeManager() {
    symbolicTable = new HashMap<String, Variable>();
    deletedScopeStack = new Stack<Map<String, Variable>>();
    addedScopeStack = new Stack<List<String>>();
    scopeCounter = 0;

    openScope();
  }

  public void openScope() {
    scopeCounter++;
    deletedScopeStack.push(new HashMap<String, Variable>());
    addedScopeStack.push(new LinkedList<String>());
  }

  public void closeScope() {
    for (String name : addedScopeStack.peek()) {
      symbolicTable.remove(name);
    }

    symbolicTable.putAll(deletedScopeStack.peek());

    deletedScopeStack.pop();
    addedScopeStack.pop();
  }

  public void add(String varName, String varType) {
    String localName = varName + "_at_" + scopeCounter;
    Variable newVariable = new Variable(localName, varType);
    Variable oldVariable = symbolicTable.get(varName);
    if (oldVariable != null) {
      deletedScopeStack.peek().put(varName, oldVariable);
    }
    symbolicTable.put(varName, newVariable);
    addedScopeStack.peek().add(varName);
  }

  public Variable get(String varName) {
    return symbolicTable.get(varName);
  }
}