/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package codigo;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author server
 */
public class cppTranslator {
    
    private String sourceCode;

    public cppTranslator(String sourceCode){
        this.sourceCode = sourceCode;
    }


    private String reemplaceVarDelcaration(String temporal){
        try{
            String pattern = "\\b[a-zA-Z_$][a-zA-Z_$0-9]*\\s*->\\s*(?:string|float|int|double|boolean)\\b;";
            Pattern regex = Pattern.compile(pattern);
            Matcher matcher = regex.matcher(temporal);
            List<int[]> matchedIndices = new ArrayList<>();
            
            while (matcher.find()) {
                int start = matcher.start();
                int end = matcher.end();
                matchedIndices.add(new int[]{start, end});
            }
            for (int[] index : matchedIndices) {
                //System.out.println(sourceCode.substring(index[0], index[1]));
                temporal = temporal.replace(sourceCode.substring(index[0], index[1]), descomponeVariables(sourceCode.substring(index[0], index[1])));
            }
        }catch(Exception e){
            System.out.println("Error en reemplaceVarDelcaration");
        }
        
        return temporal;
    }

    private String reemplaceImports(String temporal){
        try{
            String pattern = "import\\s+([a-zA-Z_$][a-zA-Z_$0-9]*)\\s*;";
            Pattern regex = Pattern.compile(pattern);
            Matcher matcher = regex.matcher(temporal);
            List<int[]> matchedIndices = new ArrayList<>();
            
            while (matcher.find()) {
                int start = matcher.start();
                int end = matcher.end();
                matchedIndices.add(new int[]{start, end});
            }
            for (int[] index : matchedIndices) {
                //System.out.println(sourceCode.substring(index[0], index[1]));
                temporal = temporal.replace(sourceCode.substring(index[0], index[1]), descomponerImport(sourceCode.substring(index[0], index[1])));
            } 
        }catch(Exception e){
            System.out.println("Error en reemplaceImports");
        }
        
        return temporal;
    }

    private String reemplaceCall(String temporal){
        try{
            String pattern = "call\\s+\\.([a-zA-Z_$][a-zA-Z_$0-9]*)\\s*;";
            Pattern regex = Pattern.compile(pattern);
            Matcher matcher = regex.matcher(temporal);
            List<int[]> matchedIndices = new ArrayList<>();
            
            while (matcher.find()) {
                int start = matcher.start();
                int end = matcher.end();
                matchedIndices.add(new int[]{start, end});
            }
            for (int[] index : matchedIndices) {
                //System.out.println(sourceCode.substring(index[0], index[1]));
                temporal = temporal.replace(sourceCode.substring(index[0], index[1]), descomponerCall(sourceCode.substring(index[0], index[1])));
            }
        }catch(Exception e){
            System.out.println("Error en reemplaceCall");
        }
        
        return temporal;
    }

    private String reemplaceFunction(String temporal){
        try{
            String pattern = ".\\b[a-zA-Z_$][a-zA-Z_$0-9]*\\s* \\s*(?:none|string|float|int|double|boolean)\\b:";
            Pattern regex = Pattern.compile(pattern);
            Matcher matcher = regex.matcher(temporal);
            List<int[]> matchedIndices = new ArrayList<>();
            
            while (matcher.find()) {
                int start = matcher.start();
                int end = matcher.end();
                System.out.println(sourceCode.substring(start, end));
                matchedIndices.add(new int[]{start, end});
            }
            for (int[] index : matchedIndices) {
                System.out.println(sourceCode.substring(index[0], index[1]));
                temporal = temporal.replace(sourceCode.substring(index[0], index[1]), descomponerFunction(sourceCode.substring(index[0], index[1])));
            }
        }catch(Exception e){
            System.out.println(e.toString());
        }
        
        return temporal;
    }

    private String reemplaceCallBack(String temporal){
        try{
            String pattern = "callback->([a-zA-Z_$][a-zA-Z_$0-9]*)\\s\\.([a-zA-Z_$][a-zA-Z_$0-9]*)\\(([^)]*)\\);";
            Pattern regex = Pattern.compile(pattern);
            Matcher matcher = regex.matcher(temporal);
            List<int[]> matchedIndices = new ArrayList<>();
            
            while (matcher.find()) {
                int start = matcher.start();
                int end = matcher.end();
                
                matchedIndices.add(new int[]{start, end});
                System.out.println(start + " " + end);
            }
            for (int[] index : matchedIndices) {
                System.out.println(sourceCode.substring(index[0], index[1]));
                temporal = temporal.replace(sourceCode.substring(index[0], index[1]), descomponerCallBack(sourceCode.substring(index[0], index[1])));
            }
        }catch(Exception e){
            System.out.println(e.toString());
        }
        return temporal;
    }

    private String descomponerFunction(String codeLine){
        return (codeLine.substring(codeLine.indexOf(" ") + 1, codeLine.indexOf(":")) + " " + codeLine.substring(codeLine.indexOf(".")+1, codeLine.indexOf(" ")) + "()").replace("none", "void");
    }    

    private String changeMain(String temporal){
        return temporal.replace(".main :", "int main()");
    }


    private String descomponerCallBack(String codeLine){
        return codeLine.substring(codeLine.indexOf("->")+2, codeLine.indexOf(" .")) + " = " + codeLine.substring(codeLine.indexOf(" .")+2, codeLine.indexOf(");")+2);
    }

    private String descomponerCall(String codeLine){
        return codeLine.substring(codeLine.indexOf(".")+1, codeLine.indexOf(";")) + "();";
    }

    private String descomponeVariables(String codeLine){
        return codeLine.substring(codeLine.indexOf("->")+2, codeLine.indexOf(";")) + " " + codeLine.substring(0, codeLine.indexOf("->")) + ";";
    }

    private String descomponerImport(String codeLine){
        return "#include \"" + codeLine.substring(codeLine.indexOf("import")+7, codeLine.indexOf(";")) + ".h\"";
    }


    public void cppTranslate(){
        sourceCode = reemplaceVarDelcaration(sourceCode);
        sourceCode = reemplaceImports(sourceCode);
        sourceCode = reemplaceCall(sourceCode);
        sourceCode = reemplaceCallBack(sourceCode);
        sourceCode = changeMain(sourceCode);
        sourceCode = reemplaceFunction(sourceCode);
    }


    public void setSourceCode(String sourceCode) {
        this.sourceCode = sourceCode;
    }


    public String getSourceCode() {
        return sourceCode;
    }

}
