package codigo;

import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;
import java.util.HashMap;

public class codeHistory{

    /*HashMap<String, String> map = new HashMap<String, String>();
    List<String> list = new ArrayList<String>();
    private int counter = 0;


    

    public String[][] getHistory(){
        //return hashmap to array
        String[][] temp = new String[map.size()][2];
        int i = 0;
        for (String key : map.keySet()) {
            temp[i][0] = key;
            temp[i][1] = map.get(key);
            i++;
        }
        return temp;
    }

    public void setData(String token){
        map.put(token, "");
    }

    public void setData(String token, String data){
        map.put(token, data);
    }

    public void setDataVar(String token, String data){
        if(!map.containsKey(data)){
            map.put("{"+Integer.toString(counter)+"}", "");
            counter++;
        }
        map.put("{"+Integer.toString(counter)+"}", "");
    }*/

    
    //private String[][] history;
    //Structure of history:
    // [0] = token
    // [1] = data
    // [2] = varCounter
    
    private String[][] history;
    List<String> list = new ArrayList<String>();
    private int counter = 0;
    private int varCounter = 0;

    public codeHistory(){
        history = new String[5000000][2];
    }

    private String[][] getDataWithoutNull(){
        //retornar arreglo hasta donde el contador se quedo
        String[][] temp = new String[counter][2];
        for(int i = 0; i < counter; i++){
            temp[i][0] = history[i][0];
            temp[i][1] = history[i][1];
        }
        return temp;
    }

    public String[][] getHistory(){
        return getDataWithoutNull();
    }

    public void setData(String token){
        history[counter][0] = token;
        history[counter][1] = "";
        counter++;
    }

    private Boolean isDuplicateVar(String varname){
        if(list.indexOf(varname) == -1){
            return false;
        }
        return true;
    }
    
    public void setDataVar(String token, String data){
        if(varCounter == 0){
            //System.out.println("Primera variable");
            list.add(data);
            history[counter][0] = "{"+Integer.toString(varCounter) + "}";
            history[counter][1] = "";
            varCounter++;
            counter++;
        }else{
            if(!isDuplicateVar(data)){
                //System.out.println("no duplicado");
                list.add(data);
                history[counter][0] = "{"+Integer.toString(varCounter) + "}";
                history[counter][1] = "";
                varCounter++;
                counter++;
           }else if(isDuplicateVar(data)){
                //System.out.println("duplicado");
                history[counter][0] = "{"+Integer.toString(list.indexOf(data))+ "}";
                history[counter][1] =  "";
                counter++;
            }
           
        }
    }
    

    private int getVarIndex(String varname){
        for(int i = 0; i < counter; i++){
            if(history[i][0].equals("Identificador") && history[i][1].equals(varname)){
                System.out.println("Encontrado");
                return i;
            }
        }
        return -1;
    }
    public void setData(String token, String data){
        history[counter][0] = token;
        history[counter][1] = data;
        counter++;
    }
    
    /*public void setDataVar(String token, String data){
        //System.out.println(token);
        if(data != null && varCounter == 0){
            history[counter][0] =String.valueOf(token);
            history[counter][1] ="{" + varCounter + "}";
            varCounter++;
        }else{
            if(data != null && !isDuplicateVar(token)){
                history[counter][0] =String.valueOf(token);
                history[counter][1] ="{" + varCounter + "}";
                varCounter++;
            }else if(data != null && isDuplicateVar(token)){
                history[counter][0] =String.valueOf(token);
                history[counter][1] ="{" + getVarIndex(data) + "}";
                varCounter++;
            }
        }
    }*/


    

}