/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package codigo;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

/**
 *
 * @author Charly Ponce
 */
public class Principal {
    
    String concat = "C:\\Users\\server\\Desktop\\AnalizadorLexico-jCup-Branch\\src\\codigo\\";
    
    public static void main(String[] args) throws Exception {
        String concat = "C:\\Users\\server\\Desktop\\AnalizadorLexico-jCup-Branch\\src\\codigo\\";
        String ruta1 = concat + "Lexer.flex";
        String ruta2 = concat + "LexerCup.flex";
        String[] rutaS = {"-parser", "Sintax", concat + "Sintax.cup"};
        generar(ruta1, ruta2, rutaS);
    }
    public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception{
        String concat1 = "C:\\Users\\server\\Desktop\\AnalizadorLexico-jCup-Branch\\";
        String concat = "C:\\Users\\server\\Desktop\\AnalizadorLexico-jCup-Branch\\src\\codigo\\";
        File archivo;
        archivo = new File(ruta1);
        JFlex.Main.generate(archivo);
        archivo = new File(ruta2);
        JFlex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
        
        Path rutaSym = Paths.get(concat+"sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get(concat1+"sym.java"), 
                Paths.get(concat +"sym.java")
        );
        Path rutaSin = Paths.get("Sintax.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get(concat+"Sintax.java"), 
                Paths.get(concat + "Sintax.java")
        );
    }
}
